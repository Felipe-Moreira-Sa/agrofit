import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;

import 'package:agro/investment.dart';

void main() async {
  runApp(MaterialApp(
    title: "Agrofit",
    theme: ThemeData.dark().copyWith(
      // Cor dos ícones
      iconTheme: const IconThemeData(
        color: Colors.grey, // Cor branca para os ícones
      ),
      // Cor dos textos
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.grey, // Cor branca para textos principais
        ),
        bodyMedium: TextStyle(
          color: Colors.grey, // Cor cinza claro para textos secundários
        ),
      ),
      // Cor de fundo do Scaffold
      scaffoldBackgroundColor: Colors.black,
      bottomAppBarTheme:
          BottomAppBarTheme(color: Colors.black), // Cor preta para o rodapé
    ),
    debugShowCheckedModeBanner: false,
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.black, // Cor de fundo preta para o tema escuro
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao AgroApp!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors
                    .grey, // Texto em branco para contraste no tema escuro
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Cuidados na utilização de agrotóxicos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors
                    .grey, // Texto em branco para contraste no tema escuro
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Leia atentamente as instruções de uso dos produtos;',
              style: TextStyle(
                fontSize: 16,
                color: Colors
                    .grey, // Texto em branco para contraste no tema escuro
              ),
            ),
            SizedBox(height: 8),
            Text(
              '2. Utilize os equipamentos de proteção individual (EPIs);',
              style: TextStyle(
                fontSize: 16,
                color: Colors
                    .grey, // Texto em branco para contraste no tema escuro
              ),
            ),
            SizedBox(height: 8),
            Text(
              '3. Armazene corretamente os agrotóxicos;',
              style: TextStyle(
                fontSize: 16,
                color: Colors
                    .grey, // Texto em branco para contraste no tema escuro
              ),
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text(
                  'Ir para AgroFit',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    animationDuration: Duration(seconds: 1),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightGreen),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(16.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Investmentagro()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
