//page pour detail de chaque liste
//recoit l'info par parametres des home

import 'package:flutter/material.dart';

import '../models/chanson.dart';

class ChansonDetailPage extends StatelessWidget {
  final Chanson chanson;
  const ChansonDetailPage({super.key, required this.chanson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chanson.titre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //info du chanson
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 12),
                    Text('Artiste: ${chanson.artiste}'),
                  ],
                ),
                const Divider(),

                //genre
                Row(
                  children: [
                    const Icon(Icons.category),
                    const SizedBox(width: 12),
                    Text('Genre: ${chanson.genre}'),
                  ],
                ),
                const Divider(),

                // tonalite
                Row(
                  children: [
                    const Icon(Icons.music_note),
                    const SizedBox(width: 12),
                    Text('Tonalite: ${chanson.tonalite}'),
                  ],
                ),
                const Divider(),

                // Tempo
                Row(
                  children: [
                    const Icon(Icons.speed),
                    const SizedBox(width: 12),
                    Text('Tempo: ${chanson.tempoBPM} BPM'),
                  ],
                ),
                const Divider(),

                //Duration
                Row(
                  children: [
                    const Icon(Icons.timer),
                    const SizedBox(width: 12),
                    Text('Duree: ${chanson.dureeSecondes} s'),
                  ],
                ),
                const Divider(),

                //Accords
                Row(
                  children: [
                    const Icon(Icons.piano),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text('Accords: ${chanson.accords.join(', ')}'),
                    ),
                  ],
                ),
                const Divider(),

                //notes, comentaires
                Row(
                  children: [
                    const Icon(Icons.note),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text('Notes/commentaires: ${chanson.notes}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
