import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Card(
            elevation: 20,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        height: 20,
                      ),
                      const Text(
                        "Meu Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "O Widget Card no Flutter é uma ferramenta versátil para a criação de elementos de interface visualmente atraentes e organizados. Ele oferece uma maneira eficaz de agrupar informações e adicionar sombras, bordas e estilos personalizados aos seus componentes, tornando o design de aplicativos mais elegante e funcional.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Ler Mais",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
