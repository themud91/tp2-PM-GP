// page pour ajouter une nouvelle chanson
// retourne la nouvelle Chanson au home grace a Navigator.pop

import 'package:flutter/material.dart';

import '../models/chanson.dart';

//Statefull Widget pour l'ajout des chansons
class AjoutChansonPage extends StatefulWidget {
  const AjoutChansonPage({super.key});

  @override
  State<AjoutChansonPage> createState() => _AjoutChansonPageState();
}

// le class pour ajouter les chanson + ses champs + constructor
class _AjoutChansonPageState extends State<AjoutChansonPage> {
  final _titreController = TextEditingController();
  final _artisteController = TextEditingController();
  final _genreController = TextEditingController();
  final _tonaliteController = TextEditingController();
  final _tempoController = TextEditingController();
  final _dureeController = TextEditingController();
  final _accordsController = TextEditingController();
  final _notesController = TextEditingController();

  void _enregistrer() {
    //avec un if pour valider si l'user a rempli les champs obligatoires. sinon show un SnackBar avec un message d'alert
    if (_titreController.text.trim().isEmpty ||
        _artisteController.text.trim().isEmpty ||
        _accordsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Les champs Titre, Artiste et accords sont requis'),
        ),
      );
      return;
    }

    final nouvelleChanson = Chanson(
      titre: _titreController.text,
      artiste: _artisteController.text,
      //champs que ne sont pas obligatoires
      genre: _genreController.text,
      tonalite: _tonaliteController.text,
      // validation champ numerique ave tryParse  pour eviter le crash si le champ est vide ou non numerique dans c cas cest 0 par default
      tempoBPM: int.tryParse(_tempoController.text) ?? 0,
      dureeSecondes: int.tryParse(_dureeController.text) ?? 0,
      accords: _accordsController.text.split(','),
      notes: _notesController.text,
    );

    Navigator.pop(context, nouvelleChanson);
  }

  // le build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une chanson')),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(
          //Titre
          children: [
            TextField(
              controller: _titreController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),

            //Artite
            TextField(
              controller: _artisteController,
              decoration: const InputDecoration(labelText: 'Artiste'),
            ),

            //Genre
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),

            //Tonalite
            TextField(
              controller: _tonaliteController,
              decoration: const InputDecoration(labelText: 'Tonalite'),
            ),

            //Tempo BPM
            TextField(
              controller: _tempoController,
              decoration: const InputDecoration(labelText: 'Tempo (BPM)'),
              keyboardType: TextInputType.number,
            ),

            //Duration
            TextField(
              controller: _dureeController,
              decoration: const InputDecoration(labelText: 'Duree (secondes)'),
              keyboardType: TextInputType.number,
            ),

            // accords
            TextField(
              controller: _accordsController,
              decoration: const InputDecoration(
                labelText: 'Accords (separes par des virgules)',
              ),
            ),

            //notes (comentaires)
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes/Commentaires',
              ),
            ),
            const SizedBox(height: 16),

            //bouton enregistrer
            ElevatedButton(
              onPressed: _enregistrer,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
