import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _image(),
            _input(),
            _result(),
            _buttomResult(),
          ],
        ),
      ),
      
    );
  }

  _image() {}

  _input() {}

  _result() {}

  _buttomResult() {}
}
