// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyModel {
  final double euro;
  final double dolar;
  final double real;
  final double bitcoin;

  static const Map exchangies = {
    'BRL-USD': 'BRL-USD',
    'BRL-EUR': 'BRL-EUR',
    'BRL-BTC': 'BRL-BTC',
    'USD-EUR': 'USD-EUR',
    'USD-BRL': 'USD-BRL',
    'USD-BTC': 'USD-BTC',
    'EUR-BRL': 'EUR-BRL',
    'EUR-USD': 'EUR-USD',
    'EUR-BTC': 'EUR-BTC',
    'BTC-EUR': 'BTC-EUR',
    'BTC-BRL': 'BTC-BRL',
    'BTC-USD': 'BTC-USD',
  };

  CurrencyModel({
    required this.euro,
    required this.dolar,
    required this.real,
    required this.bitcoin,
  });

  static Future<dynamic> getCurrencies(String from, String to) async {
    String exchange, url;
    try {
      exchange = exchangies['${from}-${to}'];
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
