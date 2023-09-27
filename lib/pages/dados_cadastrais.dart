import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/nivel_repositorie.dart';
import '../repositories/linguagens_repository.dart';
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
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i < quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
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
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
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
                                  //print(value);
                                  setState(() {
                                    nivelSelecionado = value.toString();
                                  });
                                }))
                            .toList()),
                    const TextLabel(texto: "Linguagens preferidas"),
                    Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                                setState(() {});
                              }))
                          .toList(),
                    ),
                    const TextLabel(texto: "Tempo de experiência"),
                    DropdownButton(
                        value: tempoExperiencia,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretenção Salarial R\$ ${salarioEscolhido.round()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: salarioEscolhido,
                        onChanged: (double value) {
                          setState(() {
                            salarioEscolhido = value;
                          });
                        }),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Nome deve ser preenchido")));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Data de nascimento inválida")));
                            return;
                          }
                          if (nivelSelecionado.trim() == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nível deve ser selecionado")));
                            return;
                          }
                          if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ser selecionada ao menos uma linguagem")));
                            return;
                          }
                          if (tempoExperiencia == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Tempo de experiência não pode ser igual a zero")));
                            return;
                          }
                          if (salarioEscolhido == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Pretenção salarial não pode ser igual a zero")));
                            return;
                          }
                          /*print(nomeController.text);
                          print(dataNascimento);
                          print(nivelSelecionado);
                          print(linguagensSelecionadas);
                          print(tempoExperiencia);
                          print(salarioEscolhido);
                          debugPrint("Dados salvos com sucesso!");*/
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              salvando = false;
                            });
                          });
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Dados salvos com sucesso!")));
                            salvando = true;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Salvar"))
                  ],
                ),
        ));
  }
}
