// StatelessWidget ChansonCard. Widget reutilisable pour l'affichage d'un element dans la liste (voir section 5 de l'enonce du tp)
// recoit une chanson par constructeur
// recoit un callback onTap qui s'execute au click de la card pour aller au detail
// Bonus: bouton qui fait DELETE sur les chanson cible avec onDelete + icon pour delete avec trailing: IconButton()

//on import le modele + les materiel du flutter
import '../models/chanson.dart';

import 'package:flutter/material.dart';

//creation du widget stateless
class ChansonCard extends StatelessWidget {
  final Chanson chanson;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ChansonCard({
    super.key,
    required this.chanson,
    required this.onTap,
    required this.onDelete,
  });

  //Build
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(chanson.titre),
        subtitle: Text(chanson.artiste),
        onTap: onTap,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
