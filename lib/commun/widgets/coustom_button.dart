import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/colors.dart';

class CoustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CoustomButton({super.key,
  required this.text,
  required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(
          color: balckColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:tabColor,
        minimumSize: const Size(double.infinity, 50),

      ),
    );
  }
}
