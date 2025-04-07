import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final String texto;
  final Color? color;

  const Custombutton({
    super.key,
    this.icon,
    this.onPressed,
    required this.texto,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          Text(
            texto,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
