import 'package:flutter/material.dart';
import 'package:agro/pages/stockdetailpage.dart';
import 'package:agro/pages/stocksearch.dart';
import 'models/herbicide_model.dart';
// components
import 'components/build.dart';

class Investmentagro extends StatefulWidget {
  const Investmentagro({super.key});

  @override
  State<Investmentagro> createState() => _InvestmentagroState();
}

class _InvestmentagroState extends State<Investmentagro> {
  int _selectedIndex = 0;
  bool _isPrincipal = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool isAscending = true;
  bool isSearching = false;
  String query = '';

  List<Herbicide> filteredagrofitList = [];

  // Armazena o retorno de readHerbicideJson para ser utilizado _buildStockItem
  // late Future<List<Herbicide>> agrofitList = getHerbicide("all");
  // late Future<List<Herbicide>> herbicideList = getHerbicide("herbicida");
  // late Future<List<Herbicide>> fungicideList = getHerbicide("fungicida");
  // late Future<List<Herbicide>> growthList = getHerbicide("crescimento");
  // late Future<List<Herbicide>> pesticideList = getHerbicide("inseticida");

  List<String> names = [
    "all",
    "herbicida",
    "fungicida",
    "crescimento",
    "inseticida"
  ];

  List<Future<List<Herbicide>>> agrofitList = [
    getHerbicide("all"),
    getHerbicide("herbicida"),
    getHerbicide("fungicida"),
    getHerbicide("crescimento"),
    getHerbicide("inseticida")
  ];
  // List<Herbicide> recebendo o valor de função similar readHerbicideJson()
  Widget _buildHerbicideItem(Herbicide herbicide) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              herbicide.classe,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          title: Text(herbicide.titularRegistro),
          subtitle: Text(herbicide.produtoTecnicoMarcaComercial),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Risco Tóxico ${herbicide.classificacaoToxicologica}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Risco tóxico ambiental ${herbicide.classificacaoAmbiental}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HerbicideDetailPage(
                  numeroRegistro: herbicide.numeroRegistro.toString(),
                  produtoTecnicoMarcaComercial:
                      herbicide.produtoTecnicoMarcaComercial,
                  ingredienteAtivo: herbicide.ingredienteAtivo,
                  classe: herbicide.classe,
                  titularRegistro: herbicide.titularRegistro,
                  empresaPaisTipo: herbicide.empresaPaisTipo,
                  classificacaoToxicologica:
                      herbicide.classificacaoToxicologica,
                  classificacaoAmbiental: herbicide.classificacaoAmbiental,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // search herbicide
  List<Herbicide> searchHerbicide(String query, List<Herbicide> agrofitList) {
    List<Herbicide> searchResult = [];
    String searchLowercase = query.toLowerCase();
    searchResult = agrofitList.where((herbicide) {
      String herbicideName =
          herbicide.produtoTecnicoMarcaComercial.toLowerCase();
      String herbicideTicker =
          herbicide.numeroRegistro.toString().toLowerCase();
      return herbicideName.contains(searchLowercase) ||
          herbicideTicker.contains(searchLowercase);
    }).toList();
    return searchResult;
  }

  // filtro por classificação tóxilogica
  Future<List<Herbicide>> toxicFilter(String toxicFilter, int selectIndex) {
    return getHerbicide(names[selectIndex]).then((herbicideList) {
      List<Herbicide> filteredList = herbicideList
          .where(
              (herbicide) => herbicide.classificacaoToxicologica == toxicFilter)
          .toList();
      return filteredList;
    });
  }

  // filtro por classificação ambiental
  Future<List<Herbicide>> ambientalFilter(
      String ambientalFilter, int selectIndex) {
    return getHerbicide(names[selectIndex]).then((herbicideList) {
      List<Herbicide> filteredList = herbicideList
          .where((herbicide) =>
              herbicide.classificacaoAmbiental == ambientalFilter)
          .toList();
      return filteredList;
    });
  }

  // filtro por classe
  Future<List<Herbicide>> classeFilter(String classeFilter, int selectIndex) {
    return getHerbicide(names[selectIndex]).then((herbicideList) {
      List<Herbicide> filteredList = herbicideList
          .where((herbicide) => herbicide.classe == classeFilter)
          .toList();
      return filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      // nomes das telas
      homePrincipal(agrofitList[0]),
      homePrincipal(agrofitList[1]),
      homePrincipal(agrofitList[2]),
      homePrincipal(agrofitList[3]),
      homePrincipal(agrofitList[4]),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            children: [
              SizedBox(width: 40),
              Text(
                'Agrofit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                ),
              ),
              // Icone de valorização verde
              Icon(
                // grama
                Icons.eco,
                color: Colors.green,
              ),
            ],
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            // search stock
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
              ),
            ),
            onPressed: () async {
              String? query = await showSearch(
                context: context,
                delegate: StockSearch(agrofitList[0]),
              );
              if (query != null) {
                FutureBuilder<List<Herbicide>>(
                  future: agrofitList[
                      _selectedIndex], // O parâmetro é do tipo Future<List<Herbicide>>
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      final List<Herbicide> data =
                          snapshot.data!; // Obtém a lista de Herbicide
                      List<Herbicide> searchResult =
                          searchHerbicide(query, data);
                      setState(() {
                        agrofitList[_selectedIndex] =
                            Future.value(searchResult);
                      });
                      return ListView.builder(
                        itemCount: searchResult.length,
                        itemBuilder: (context, index) {
                          return _buildHerbicideItem(searchResult[index]);
                        },
                      );
                    }
                    // Tratamento de erro ou caso não haja dados disponíveis
                    return Center(
                      child: Text('Nenhum dado disponível'),
                    );
                  },
                );
              }
            },
          ),
          // IconButton com filtros de classificação toxilogica
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String result) {
              setState(() {
                agrofitList[_selectedIndex] =
                    toxicFilter(result, _selectedIndex);
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              // titulo fixo
              const PopupMenuItem<String>(
                child: Text('Risco Tóxico'),
                enabled: false,
              ),
              const PopupMenuItem<String>(
                value: 'I',
                child: Text('Extremamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'II',
                child: Text('Altamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'III',
                child: Text('Moderadamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'IV',
                child: Text('Pouco tóxico'),
              ),
            ],
          ),
          // IconButton com filtros de classificação ambiental
          PopupMenuButton<String>(
            // icone meio ambiente
            icon: const Icon(Icons.eco_sharp),

            onSelected: (String result) {
              setState(() {
                agrofitList[_selectedIndex] =
                    ambientalFilter(result, _selectedIndex);
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              // titulo fixo
              const PopupMenuItem<String>(
                child: Text('Risco Ambiental'),
                enabled: false,
              ),
              const PopupMenuItem<String>(
                value: 'I',
                child: Text('Extremamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'II',
                child: Text('Altamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'III',
                child: Text('Moderadamente tóxico'),
              ),
              const PopupMenuItem<String>(
                value: 'IV',
                child: Text('Pouco tóxico'),
              ),
            ],
          ),
          // IconButton com filtros de classe
          PopupMenuButton<String>(
            // agrotoxicos
            icon: const Icon(Icons.agriculture),
            onSelected: (String result) {
              setState(() {
                agrofitList[_selectedIndex] =
                    classeFilter(result, _selectedIndex);
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: Text('Classe'),
                enabled: false,
              ),
              const PopupMenuItem<String>(
                value: 'Herbicida',
                child: Text('Anti ervas-daninhas'),
              ),
              const PopupMenuItem<String>(
                value: 'Fungicida',
                child: Text('Anti fungos'),
              ),
              const PopupMenuItem<String>(
                value: 'Inseticida',
                child: Text('Anti insetos'),
              ),
              const PopupMenuItem<String>(
                value: 'Acaricida',
                child: Text('Anti ácaros'),
              ),
              const PopupMenuItem<String>(
                value: 'ematicida',
                child: Text('Anti vermes'),
              ),
              const PopupMenuItem<String>(
                value: 'ormicida',
                child: Text('Anti formigas'),
              ),
              const PopupMenuItem<String>(
                value: 'upinicida',
                child: Text('Anti cupins'),
              ),
              const PopupMenuItem<String>(
                value: 'actericida',
                child: Text('Anti Bacterias'),
              ),
              const PopupMenuItem<String>(
                value: 'crescimento',
                child: Text('Fertilizante'),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _isPrincipal = !_isPrincipal;
                });
              },
              icon: Icon(_isPrincipal ? Icons.list : Icons.grid_view_rounded)),
        ],
        // style
        backgroundColor:
            Colors.black, // cor do fundo da barra superior do aplicativo
      ),
      body: telas[_selectedIndex],
      // Menu inferior com navegação entre as paginas
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // Icone de Home
            icon: Icon(Icons.home),
            label: 'Agro',
            activeIcon: Icon(Icons.home, color: Colors.lightGreen),
          ),
          BottomNavigationBarItem(
            // Icone de Agrotóxicos
            icon: Icon(Icons.grass),
            label: 'Herbicidas',
          ),
          BottomNavigationBarItem(
            // Icone de Fungicidas
            icon: Icon(Icons.bug_report),
            label: 'Fungicidas',
          ),
          BottomNavigationBarItem(
            // Icone de Fertilizantes
            icon: Icon(Icons.grain),
            label: 'Fertilizantes',
          ),
          BottomNavigationBarItem(
            // Icone de Defensivos
            icon: Icon(Icons.shield),
            label: 'Defensivos',
          ),
        ],
      ),
    );
  }

  Widget homePrincipal(
    Future<List<Herbicide>>
        agrofitList, // O parâmetro é do tipo Future<List<Herbicide>>
  ) {
    return FutureBuilder<List<Herbicide>>(
      future: agrofitList, // O parâmetro é do tipo Future<List<Herbicide>>
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final List<Herbicide> data =
              snapshot.data!; // Obtém a lista de Herbicide
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _isPrincipal
                  ? buildStockItem(data[index])
                  : _buildHerbicideItem(data[index]);
            },
          );
        }

        // Tratamento de erro ou caso não haja dados disponíveis
        return Center(
          child: Text('Nenhum dado disponível'),
        );
      },
    );
  }
}
