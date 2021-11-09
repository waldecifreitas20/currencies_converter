import 'package:conversor_moedas/app/controllers/input_controller.dart';
import 'package:conversor_moedas/app/widgets/input_value_widget.dart';
import 'package:flutter/material.dart';

class InputsRow extends StatefulWidget {
  final TextEditingController controllerof;
  final bool readOnly;
  String currencyField;
  InputsRow({Key? key, required this.controllerof, required this.currencyField,required this.readOnly})
      : super(key: key);

  @override
  _InputsRowState createState() => _InputsRowState();
}

class _InputsRowState extends State<InputsRow> {
  String? currentItem = InputController.value_items[0];

  @override
  void initState() {
    InputController.currencySelectedFrom = currentItem as String;
    InputController.currencySelectedTo = currentItem as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _currenciesSelector(context),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: InputValue(controller: widget.controllerof, readOnly: widget.readOnly,),
          )
        ],
      ),
    );
  }

  _currenciesSelector(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
        value: currentItem,
        items: InputController.value_items.map((item) {
          return DropdownMenuItem(child: Text(item), value: item);
        }).toList(),
        isExpanded: true,
        onChanged: (String? currency) {
          setState(() {
            if (widget.currencyField == 'from') {
              InputController.currencySelectedFrom = currency as String;
            } else {
              InputController.currencySelectedTo = currency as String;
            }
            currentItem = currency;
          });
        },
        iconEnabledColor: Colors.amber,
        underline: Container(
          color: Colors.amber,
          height: 2,
        ),
      ),
    );
  }
}
