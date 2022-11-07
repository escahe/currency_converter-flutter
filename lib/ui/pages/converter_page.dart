import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/key_pad.dart';

// un widget con estado en el cual mantenemos los dos indices
// de las monedas que vamos a convertir
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget
  String currency1 = currencies[1];
  String currency2 = currencies.first;

  // función para construir el selector de monedas
  @override
  Widget build(BuildContext context) {
    // El siguiente widget en el arbol es el Scaffold
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency converter'),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // selector para la primera moneda
              DropdownButton(
                underline: Container(
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                value: currency1,
                icon: const Icon(Icons.arrow_downward_sharp),
                iconSize: 20,
                elevation: 20,
                onChanged: (String? value) => setState(() {
                  currency1 = value!;
                }),
                items: currencies
                    .map((String value) =>
                        DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
              ),
              // selector para la segunda moneda
              DropdownButton(
                underline: Container(
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                value: currency2,
                icon: const Icon(Icons.arrow_downward_sharp),
                iconSize: 20,
                elevation: 20,
                onChanged: (String? value) => setState(() {
                  currency2 = value!;
                }),
                items: currencies
                    .map((String value) =>
                        DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
              ),
            ],
          ),
          Expanded(
              // los nombres de las monedas se pueden obtener en la lista currencies
              // la tasa de cambio se puede obtener en la estructura de datos rates
              child: Center(
            child: KeyPad(
                textCurrency1: currency1,
                textCurrency2: currency2,
                rate: rates[currencies.indexOf(currency1)]
                    [currencies.indexOf(currency2)]),
          ))
        ]));
  }
}
