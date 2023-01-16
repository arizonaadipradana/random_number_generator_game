import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;

  ResultPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(result),
      ),
    );
  }
}