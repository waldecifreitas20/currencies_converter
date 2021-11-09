import 'package:conversor_moedas/app/controllers/input_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async{
  var converted = await InputController.convert();
  print(converted);
}
