import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback handler;
  final String text;
  
  Answer(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.lightBlue;
    }

    return Container(
      width: double.infinity,
      child: TextButton(
              onPressed: handler,
              child: Text(text),
              style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith(getColor)),
              )
    );
  }
}