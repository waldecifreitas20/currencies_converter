// ignore_for_file: non_constant_identifier_names

import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class InputController {
  static TextEditingController fromText = TextEditingController();
  static TextEditingController toText = TextEditingController();

  static String currencySelectedTo = '';
  static String currencySelectedFrom = '';

  static const value_items = ['BRL', 'USD', 'EUR', 'BTC'];

  static Future<void> convert() async {
    if (currencySelectedFrom == currencySelectedTo) {
      toText.text = 'R\$ ${fromText.text}';
    } else {
      
      var textValue = await CurrencyModel.getCurrencies(
          currencySelectedFrom, currencySelectedTo);

      double from = double.tryParse(fromText.text) ?? 1;
      double to = double.tryParse(textValue) ?? 1;
      String result = '${from * to}';

      toText.text = '\$ $result';
    }
  }
}
