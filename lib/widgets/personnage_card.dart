// carte d'un personnage d la liste

import 'package:flutter/material.dart';

import '../models/personnage.dart';
import '../utils/filtres.dart';

class PersonnageCard extends StatelessWidget {
  const PersonnageCard({
    required this.personnage,
    required this.onTap,
    super.key,
  });

  final Personnage personnage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Image.network(
          personnage.image,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.person),
        ),
        title: Text(personnage.nom),
        subtitle: Text('${personnage.race}, ki : ${formaterKi(personnage.ki)}'),
      ),
    );
  }
}
