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
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App", style: GoogleFonts.roboto()),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ações do usuário",
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Text(
              "Foi clicado $quantidadeCliques vezes",
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Text(
              "O número gerado foi: $numeroGerado",
              style: GoogleFonts.acme(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              quantidadeCliques += 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(100);
            });
          },
          child: const Icon(Icons.shuffle)),
    );
  }
}
