import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agro/models/herbicide_model.dart';
// import 'package:agro/pages/stockdetailpage.dart';

class StockSearch extends SearchDelegate<String> {
  final Future<List<Herbicide>> herbicideList;

  StockSearch(this.herbicideList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Herbicide>>(
      future: herbicideList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
        final List<Herbicide> data = snapshot.data ?? [];
        final List<Herbicide> searchResult = data
            .where((herbicide) =>
                herbicide.produtoTecnicoMarcaComercial
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                herbicide.numeroRegistro.toString().contains(query.toLowerCase()))
            .toList();
        return ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (context, index) {
            final Herbicide herbicide = searchResult[index];
            return ListTile(
              title: Text(
                herbicide.produtoTecnicoMarcaComercial,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                herbicide.numeroRegistro.toString(),
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                close(context, herbicide.produtoTecnicoMarcaComercial);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Herbicide>>(
      future: herbicideList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        final List<Herbicide> data = snapshot.data ?? [];
        final List<Herbicide> searchResult = data
            .where((herbicide) =>
                herbicide.produtoTecnicoMarcaComercial
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                herbicide.numeroRegistro.toString().contains(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (context, index) {
            final Herbicide herbicide = searchResult[index];
            return ListTile(
              title: Text(
                herbicide.produtoTecnicoMarcaComercial,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                herbicide.numeroRegistro.toString(),
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                query = herbicide.produtoTecnicoMarcaComercial;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
