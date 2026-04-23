import 'package:calculadora/components/button.dart';
import 'package:calculadora/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow([
            Button.two(text: "AC", color: Button.DARK, cb: cb),
            Button(text: "%", color: Button.DARK, cb: cb),
            Button.oprt(text: "/", cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: "7", cb: cb),
            Button(text: "8", cb: cb),
            Button(text: "9", cb: cb),
            Button.oprt(text: "x", cb: cb)
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: "4", cb: cb),
            Button(text: "5", cb: cb),
            Button(text: "6", cb: cb),
            Button.oprt(text: "-", cb: cb)
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: "1", cb: cb),
            Button(text: "2", cb: cb),
            Button(text: "3", cb: cb),
            Button.oprt(text: "+", cb: cb)
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.two(text: "0", cb: cb),
            Button(text: ",", cb: cb),
            Button(text: "=", cb: cb)
          ])
        ],
      ),
    );
  }
}