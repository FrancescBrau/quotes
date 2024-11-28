import 'package:flutter/material.dart';

class QuoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const QuoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, child: const Text('Get a new Quote'));
  }
}
