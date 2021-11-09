import 'package:conversor_moedas/app/controllers/input_controller.dart';
import 'package:conversor_moedas/app/widgets/input_value_widget.dart';
import 'package:conversor_moedas/app/widgets/inputs_row_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              _logo(context),
              const SizedBox(height: 70),
              InputsRow(
                controllerof: InputController.fromText,
                currencyField: 'from',
                readOnly: false,
              ),
              const SizedBox(height: 30),
              InputsRow(
                controllerof: InputController.toText,
                currencyField: 'to',
                readOnly: true,
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text('Converter')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return Center(
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://booster.io/wp-content/uploads/gateways-currency-e1443808519595.png'),
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  void onPressed() {
    setState(() {
      InputController.convert();
      InputController.currencySelectedTo;
    });
  }
}
