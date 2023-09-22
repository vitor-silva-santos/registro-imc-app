import 'package:desafio_app_imc/shared/colors_imc.dart';
import 'package:desafio_app_imc/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BoxLegendaWidget extends StatelessWidget {
  const BoxLegendaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox espacoEntreCorFrase = const SizedBox(
      width: 10,
    );

    TextWidget textLegenda(String texto) => TextWidget(
          txt: texto,
          size: 16,
          // weight: true,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Wrap(
        children: [
          const TextWidget(
            txt: "LEGENDA:",
            weight: true,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[0][1],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[0][1].toString())
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[3][4],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[3][4].toString())
              ],
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[1][2],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[1][2].toString())
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[4][5],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[4][5].toString())
              ],
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[2][3],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[2][3].toString())
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: coresImc[5][6],
                ),
                espacoEntreCorFrase,
                textLegenda(frasesImc[5][6].toString())
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
