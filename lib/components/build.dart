import 'package:flutter/material.dart';
import 'package:agro/models/herbicide_model.dart';


Widget buildStockItem(Herbicide herbicide) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    herbicide.produtoTecnicoMarcaComercial,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Número de Registro: ${herbicide.numeroRegistro}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ingrediente Ativo: ${herbicide.ingredienteAtivo}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Classe: ${herbicide.classe}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Titular do Registro: ${herbicide.titularRegistro}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Empresa/País/Tipo: ${herbicide.empresaPaisTipo}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Classificação Toxicológica: ${herbicide.classificacaoToxicologica}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Classificação Ambiental: ${herbicide.classificacaoAmbiental}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Text(
                  //   'Culturas Aplicáveis: ${herbicide.culturasAplicaveis}',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  // Text(
                  //   'Aplicabilidade: ${herbicide.aplicabilidade}',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          )
    );
  }

