import 'dart:convert';
import 'package:flutter/services.dart';

class Herbicide {
  final int numeroRegistro;
  final String produtoTecnicoMarcaComercial;
  final String ingredienteAtivo;
  final String classe;
  final String titularRegistro;
  final String empresaPaisTipo;
  final String classificacaoToxicologica;
  final String classificacaoAmbiental;
  final String riscoToxilogico;
  final String riscoAmbiental;

  Herbicide({
    required this.numeroRegistro,
    required this.produtoTecnicoMarcaComercial,
    required this.ingredienteAtivo,
    required this.classe,
    required this.titularRegistro,
    required this.empresaPaisTipo,
    required this.classificacaoToxicologica,
    required this.classificacaoAmbiental,
    required this.riscoToxilogico,
    required this.riscoAmbiental,
  });

  factory Herbicide.fromJson(Map<String, dynamic> json) {
    return Herbicide(
      numeroRegistro: json['NUMERO_REGISTRO'],
      produtoTecnicoMarcaComercial: json['PRODUTO_TECNICO_MARCA_COMERCIAL'],
      ingredienteAtivo: json['INGREDIENTE_ATIVO(GRUPO_QUIMICI)(CONCENTRACAO)'],
      classe: json['CLASSE'],
      titularRegistro: json['TITULAR_REGISTRO'],
      empresaPaisTipo: json['EMPRESA_<PAIS>_TIPO'],
      classificacaoToxicologica: json['CLASSIFICACAO_TOXICOLOGICA'],
      classificacaoAmbiental: json['CLASSIFICACAO_AMBIENTAL'],
      riscoToxilogico: json['RISCO_TOXILOGICO'],
      riscoAmbiental: json['RISCO_AMBIENTAL'],
    );
  }
}

Future<List<Herbicide>> getHerbicide(String name) async {
  final String response = await rootBundle.loadString('assets/$name.json');
  final data = await json.decode(response);
  List<Herbicide> herbicideList = [];
  for (var u in data) {
    Herbicide herbicide = Herbicide.fromJson(u);
    herbicideList.add(herbicide);
  }
  print(herbicideList.length);
  return herbicideList;
}
