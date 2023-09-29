import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';
import 'package:trilhaapp/pages/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetail = CardDetail(
      1,
      "Meu Card",
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      "O Widget Card no Flutter é uma ferramenta versátil para a criação de elementos de interface visualmente atraentes e organizados. Ele oferece uma maneira eficaz de agrupar informações e adicionar sombras, bordas e estilos personalizados aos seus componentes, tornando o design de aplicativos mais elegante e funcional...");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardDetailPage(
                            cardDetail: cardDetail,
                          )));
            },
            child: Hero(
              tag: cardDetail.id,
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            cardDetail.url,
                            height: 20,
                          ),
                          Text(
                            cardDetail.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(cardDetail.text,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Ler Mais",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
