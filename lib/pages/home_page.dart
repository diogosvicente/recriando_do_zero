import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App", style: GoogleFonts.roboto()),
      ),
      body: Center(
          child: Text(
        numeroGerado.toString(),
        style: GoogleFonts.acme(fontSize: 20),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(100);
            });
          },
          child: const Icon(Icons.shuffle)),
    );
  }
}
