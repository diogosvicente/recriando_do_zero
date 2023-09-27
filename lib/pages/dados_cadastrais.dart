import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/nivel_repositorie.dart';

import '../shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    super.initState();
  }

  /*Text returnText(String texto) {
    return (Text(texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextLabel(texto: "Nome"),
              TextField(controller: nomeController),
              const SizedBox(height: 10),
              const TextLabel(texto: "Data de Nascimento"),
              TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2023, 10, 23));
                  if (data != null) {
                    dataNascimentoController.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),
              const TextLabel(texto: "Nível de experiência"),
              Column(
                  children: niveis
                      .map((nivel) => RadioListTile(
                          dense: true,
                          title: Text(nivel),
                          selected: nivelSelecionado == nivel,
                          value: nivel,
                          groupValue: nivelSelecionado,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              nivelSelecionado = value.toString();
                            });
                          }))
                      .toList()),
              TextButton(
                  onPressed: () {
                    debugPrint(nomeController.text);
                    print(dataNascimento);
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
