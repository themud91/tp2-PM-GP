// message d'erreur avec bouton Reessayer

import 'package:flutter/material.dart';

class ErreurWidget extends StatelessWidget {
  const ErreurWidget({
    required this.message,
    required this.onReessayer,
    super.key,
  });

  final String message;

  final Function() onReessayer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onReessayer,
              child: const Text('Reessayer'),
            ),
          ],
        ),
      ),
    );
  }
}
