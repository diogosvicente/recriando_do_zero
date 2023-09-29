import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';
import 'card_page.dart';
import 'pagina2.dart';
import 'pagina3.dart';

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
                Pagina2Page(),
                Pagina3Page(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person))
              ])
        ],
      ),
    );
  }
}
