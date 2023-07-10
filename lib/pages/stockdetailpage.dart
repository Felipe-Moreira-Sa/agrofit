// Criar HerbicideDetailPage
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:path_provider/path_provider.dart';

// import 'package:gallery_saver/gallery_saver.dart';

class HerbicideDetailPage extends StatefulWidget {
  final String numeroRegistro;
  final String produtoTecnicoMarcaComercial;
  final String ingredienteAtivo;
  final String classe;
  final String titularRegistro;
  final String empresaPaisTipo;
  final String classificacaoToxicologica;
  final String classificacaoAmbiental;

  const HerbicideDetailPage({
    Key? key,
    required this.numeroRegistro,
    required this.produtoTecnicoMarcaComercial,
    required this.ingredienteAtivo,
    required this.classe,
    required this.titularRegistro,
    required this.empresaPaisTipo,
    required this.classificacaoToxicologica,
    required this.classificacaoAmbiental,
  }) : super(key: key);

  @override
  _HerbicideDetailPageState createState() => _HerbicideDetailPageState();
} 

class _HerbicideDetailPageState extends State<HerbicideDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Consumir assets/${widget.ticker}.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Criar HerbicideDetailPageState.buildAppBar
      appBar: AppBar(
        title: Text(
          widget.produtoTecnicoMarcaComercial,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Criar HerbicideDetailPageState.buildAppBar.actions
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo
      body: buildHerbicideInfo(),
    );
  }

  // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo
  Widget buildHerbicideInfo() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoHeader
            buildHerbicideInfoHeader(),
            // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem
            buildHerbicideInfoItem(
                title: 'Número de Registro',
                value: widget.numeroRegistro,
                valueColor: Colors.blueAccent),

            // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem
            buildHerbicideInfoItem(
                title: 'Produto Técnico/Marca Comercial',
                value: widget.produtoTecnicoMarcaComercial,
                valueColor: Colors.blueAccent),
            // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem
            buildHerbicideInfoItem(
                title: 'Ingrediente Ativo',
                value: widget.ingredienteAtivo,
                valueColor: Colors.blueAccent),
            // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem
            buildHerbicideInfoItem(
                title: 'Classe',
                value: widget.classe,
                valueColor: Colors.blueAccent),

            // Titulo da tabela
            Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Directory> getApplicationDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  // Percent
  Widget buildHerbicideInfoItem({
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  // Criar buildHerbicideInfoHeader()
  Widget buildHerbicideInfoHeaderTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoHeader.buildHerbicideInfoHeaderTitle.buildHerbicideInfoHeaderTitleName
          buildHerbicideInfoHeaderTitleName(),
        ],
      ),
    );
  }

  // Criar buildHerbicideInfoHeaderTitleName()
  Widget buildHerbicideInfoHeaderTitleName() {
    return Text(
      widget.produtoTecnicoMarcaComercial,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem.buildHerbicideInfoItemTitle
  Widget buildHerbicideInfoItemTitle(String title) {
    return Container(
      width: 100,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem.buildHerbicideInfoItemValue
  Widget buildHerbicideInfoItemValue(String value) {
    return Expanded(
      child: Row(
        children: [
          // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem.buildHerbicideInfoItemValue.buildHerbicideInfoItemValueText
          buildHerbicideInfoItemValueText(value),
          // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem.buildHerbicideInfoItemValue.buildHerbicideInfoItemValueIcon
        ],
      ),
    );
  }

  // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoItem.buildHerbicideInfoItemValue.buildHerbicideInfoItemValueText
  Widget buildHerbicideInfoItemValueText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  // Criar buildHerbicideInfoHeader
  Widget buildHerbicideInfoHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          // Criar HerbicideDetailPageState.buildBody.buildHerbicideInfo.buildHerbicideInfoHeader.buildHerbicideInfoHeaderTitle
          buildHerbicideInfoHeaderTitle(),
        ],
      ),
    );
  }
}
