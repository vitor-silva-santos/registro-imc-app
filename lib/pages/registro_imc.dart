import 'package:desafio_app_imc/model/imc.dart';
import 'package:desafio_app_imc/repository/imc_repository.dart';
import 'package:desafio_app_imc/shared/widgets/box_legenda.dart';
import 'package:desafio_app_imc/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RegistroIMC extends StatefulWidget {
  const RegistroIMC({super.key});

  @override
  State<RegistroIMC> createState() => _RegistroIMCState();
}

class _RegistroIMCState extends State<RegistroIMC> {
  TextEditingController pesoController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  List<Imc> _imc = [];
  ImcRepository imcRepository = ImcRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    _imc = await imcRepository.listarImcs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextWidget(
        txt: "REGISTRO - IMC",
        size: 20,
        cor: Colors.white,
        weight: true,
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pesoController.text = "";
            alturaController.text = "";
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 221, 241, 222),
                    title: const TextWidget(
                      txt: "CALCULAR IMC",
                      size: 18,
                      weight: true,
                    ),
                    content: SizedBox(
                      width: 200,
                      child: Wrap(alignment: WrapAlignment.center, children: [
                        SizedBox(
                          width: 180,
                          child: TextField(
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.balance),
                                  border: OutlineInputBorder(),
                                  labelText: "Peso (KG)"),
                              controller: pesoController,
                              keyboardType: TextInputType.number),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.height),
                                // prefixIcon: Icon(Icons.height),
                                border: OutlineInputBorder(),
                                labelText: "Altura (CM)"),
                            controller: alturaController,
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ]),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const TextWidget(
                            txt: "CANCELAR",
                            cor: Colors.red,
                          )),
                      TextButton(
                          onPressed: () {
                            if (alturaController.text == "" ||
                                pesoController.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Peso ou altura tem que ser preenchido !"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ));
                              return;
                            }

                            imcRepository.adicionar(Imc(
                                altura: double.parse(alturaController.text),
                                peso: double.parse(pesoController.text)));
                            carregarDados();
                            Navigator.pop(context);
                          },
                          child: const TextWidget(
                            txt: "SALVAR",
                            cor: Colors.green,
                          )),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)),
      body: Column(
        children: [
          const BoxLegendaWidget(),
          _imc.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.block_flipped,
                        // color: Colors.red,
                        size: 80,
                      ),
                      TextWidget(
                        txt: "LISTA VAZIA",
                        size: 25,
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _imc.length,
                    itemBuilder: (itemBuilde, index) {
                      Imc imc = _imc[index];

                      return Dismissible(
                        key: Key(imc.id),
                        background: Container(color: Colors.red.shade500),
                        onDismissed: (direction) {
                          imcRepository.remover(id: imc.id);
                          carregarDados();
                        },
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            tileColor: const Color.fromARGB(255, 245, 244, 244),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                TextWidget(size: 17, txt: "Peso", weight: true),
                                TextWidget(
                                    size: 17, txt: "Altura", weight: true),
                                TextWidget(size: 17, txt: "IMC", weight: true),
                                TextWidget(size: 17, txt: "Cor", weight: true),
                              ],
                            ),
                            subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextWidget(size: 16, txt: "${imc.peso} Kg"),
                                  TextWidget(size: 16, txt: "${imc.altura} M"),
                                  TextWidget(
                                      size: 16,
                                      txt: imc.calcularIMC().toString()),
                                  Container(
                                    color: imc.corImc(imc.calcularIMC()),
                                    height: 20,
                                    width: 30,
                                  ),
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
