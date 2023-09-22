import 'package:desafio_app_imc/pages/registro_imc.dart';
import 'package:desafio_app_imc/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 84, 131, 85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const TextWidget(
            //   txt: "REGISTRO DE IMC",
            //   cor: Colors.white,
            //   weight: true,
            //   size: 32,
            // ),
            Stack(
              children: [
                // Stroked text as border.
                Text(
                  'REGISTRO DE IMC',
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.white,
                  ),
                ),

                // Solid text as fill.
                const Text(
                  'REGISTRO DE IMC',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 84, 131, 85),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 79, 197, 10),
                            Color.fromARGB(255, 62, 141, 16),
                            Color.fromARGB(255, 47, 97, 19),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistroIMC()));
                    },
                    child: const TextWidget(
                      txt: "ENTRAR",
                      size: 18,
                      cor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
