//homepage avec son Statefulwidget pour editer les chansons

import 'package:flutter/material.dart';

import '../models/chanson.dart';
import '../widgets/chanson_card.dart';
import '../pages/chanson_detail_page.dart';
import '../pages/ajout_chanson_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Chanson> chansons = [
    Chanson(
      titre: 'Walk',
      artiste: 'Pantera',
      genre: 'Metal',
      tonalite: "Mi mineur",
      tempoBPM: 120,
      dureeSecondes: 200,
      accords: ['Mi mineur', 'La mineur', 'Sol'],
      notes: 'Released: 1990',
    ),
    Chanson(
      titre: 'Cowboys from hell',
      artiste: 'Pantera',
      genre: 'Metal',
      tonalite: 'RE mineur',
      tempoBPM: 120,
      dureeSecondes: 200,
      accords: ['Mi mineur', 'La mineur', 'Sol'],
      notes: 'Released: 1990',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nouvelleChanson = await Navigator.push<Chanson>(
            context,
            MaterialPageRoute(builder: (context) => const AjoutChansonPage()),
          );

          if (nouvelleChanson != null) {
            setState(() {
              chansons.add(nouvelleChanson);
            });
          }
        },
        child: const Icon(Icons.add),
      ),

      //titre app
      appBar: AppBar(title: const Text('Répertoire musical')),

      //body
      body: Column(
        //img
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chansons.length,
              itemBuilder: (context, index) {
                return ChansonCard(
                  chanson: chansons[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChansonDetailPage(chanson: chansons[index]),
                      ),
                    );
                  },

                  //pour delete un chanson
                  onDelete: () {
                    setState(() {
                      chansons.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
