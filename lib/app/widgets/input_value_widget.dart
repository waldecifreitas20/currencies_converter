import 'package:conversor_moedas/app/controllers/input_controller.dart';
import 'package:flutter/material.dart';

class InputValue extends StatefulWidget {
  final bool readOnly;
  final TextEditingController controller;
  const InputValue({Key? key, required this.controller, required this.readOnly})
      : super(key: key);

  @override
  _InputValueState createState() => _InputValueState();
}

class _InputValueState extends State<InputValue> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 32.5,
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        style: const TextStyle(fontSize: 20, locale: Locale('br', 'BR')),
        enabled: true,
      ),
    );
  }
}
