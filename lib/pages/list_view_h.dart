import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.img2),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Este é um subtítulo\nCom mais de uma linha"),
              Text("08:42"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "menu1") {
                debugPrint(menu);
              }
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "menu1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "menu2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "menu3", child: Text("Opção 3"))
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.img1),
        Image.asset(AppImages.img2),
        Image.asset(AppImages.img3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3)
      ],
    );
  }
}
