import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Camera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: Text("Galeria"),
                            leading: Icon(Icons.photo_album)),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: const Text("Diogo Vicente"),
                accountEmail: const Text("diogosvicente@gmail.com")),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 5),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        child: Column(
                          children: [
                            Text("Termos de uso e privacidade",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ao utilizar nosso aplicativo, você concorda em cumprir todas as diretrizes e regulamentos estabelecidos. Respeite os direitos dos outros usuários e não compartilhe informações pessoais sensíveis. Aproveite sua experiência com responsabilidade. Qualquer violação destes termos pode resultar na suspensão ou encerramento da sua conta. Suas informações pessoais serão tratadas com cuidado e não serão compartilhadas sem sua permissão. Se tiver dúvidas ou preocupações, entre em contato conosco através dos meios fornecidos no aplicativo. Obrigado por escolher nosso serviço e aproveite!",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ));
                  });
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.album),
                    SizedBox(width: 5),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
