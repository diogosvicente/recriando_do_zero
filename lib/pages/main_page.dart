import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';
import 'card_page.dart';
import 'image_assets.dart';
import 'list_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              //scrollDirection: Axis.vertical,
              children: const [
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontal()
              ],
            ),
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: "Pag3", icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: "Pag4", icon: Icon(Icons.list))
              ])
        ],
      ),
    );
  }
}
