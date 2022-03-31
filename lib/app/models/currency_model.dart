// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyModel {
  final double euro;
  final double dolar;
  final double real;
  final double bitcoin;

  CurrencyModel({
    required this.euro,
    required this.dolar,
    required this.real,
    required this.bitcoin,
  });

  static Future<dynamic> getCurrencies(String from, String to) async {
    String exchange, url;
    try {
      exchange = '${from}-${to}';
      url = 'https://economia.awesomeapi.com.br/json/last/$exchange';
      
      var response = await http
          .get(Uri.parse(url))
          .then((value) => jsonDecode(value.body));

      return response["$from$to"]["bid"];
    } catch (exception) {
      throw Exception('Sem conexão com a internet!');
    }
  }
}
