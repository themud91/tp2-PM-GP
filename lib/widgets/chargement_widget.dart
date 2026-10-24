// chargement_widget.dart indicateur de chargement reutilisable

import 'package:flutter/material.dart';

// widget sans etat affiche un CircularProgressIndicator au centre
class ChargementWidget extends StatelessWidget {
  const ChargementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
