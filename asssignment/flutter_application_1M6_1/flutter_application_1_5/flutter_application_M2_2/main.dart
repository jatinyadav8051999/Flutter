import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _YourPageState extends State<YourPage> {
  int _age1 = 0, _age2 = 0, _totalAge = 0;
  final firstNumber = TextEditingController();
  final secondNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: firstNumber,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onSubmitted: (String value) {},
            ),
            TextField(
              controller: secondNumber,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onSubmitted: (String value) {},
            ),
            Text(
              'Sum is: ${firstNumber.text + secondNumber.text}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}