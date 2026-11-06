import 'package:flutter/material.dart';

class RegisterLoginDivider extends StatelessWidget {
  final String text;
  const RegisterLoginDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: const Divider(color: Color(0xFFE2E7F0))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Color(0xFF14203D)),
          ),
        ),
        Expanded(child: const Divider(color: Color(0xFFE2E7F0))),
      ],
    );
  }
}
