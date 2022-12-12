import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onPressed;
  const Button({ Key? key, required this.title, required this.onPressed, this.backgroundColor = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool outline = backgroundColor == Colors.transparent;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: MaterialButton(
        height: 50,
        shape: outline ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Colors.blue,
            width: 1
          ),
        ) : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: outline ? Colors.white : backgroundColor,
        child: Text(title, style: TextStyle(color: outline ? Colors.blue : Colors.white)),
        onPressed: onPressed
      ),
    );
  }
}