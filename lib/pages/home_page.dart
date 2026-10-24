// page d'accueil affiche la liste selon l'etat du ListeProvider

//imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/liste_provider.dart';
import '../widgets/chargement_widget.dart';
import '../widgets/erreur_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dragon Ball')),
      body: Consumer<ListeProvider>(
        builder: (context, liste, child) {
          return switch (liste.etat) {
            //  circulo carga
            EtatListe.chargement => const ChargementWidget(),
            EtatListe.erreur => ErreurWidget(
              message: liste.messageErreur,
              onReessayer: liste.charger,
            ),

            EtatListe.vide => const Center(child: Text('Aucun personnage')),
            EtatListe.succes => Center(
              child: Text('${liste.personnages.length} personnages'),
            ),
          };
        },
      ),
    );
  }
}
