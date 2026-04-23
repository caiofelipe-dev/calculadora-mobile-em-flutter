import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATOR = Color.fromRGBO(250, 150, 13, 1);

  final String text;
  final bool two;
  final Color color;
  final void Function(String) cb; //callback

  const Button({
    required this.text,
    required this.cb,
    this.two = false,
    this.color = DEFAULT,
    super.key
  });
  const Button.two({
    required this.text,
    required this.cb,
    this.two = true,
    this.color = DEFAULT,
    super.key
  });
  const Button.oprt({ //operador
    required this.text,
    required this.cb,
    this.two = false,
    this.color = OPERATOR,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: two ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        onPressed: () => cb(text),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}