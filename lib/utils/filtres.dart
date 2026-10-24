// fonctions pures de filtrage de tri et formatage

import '../models/personnage.dart';

// retourne une copie triee de la liste, critere nom ou race
// la liste original n'est pas modifiee
List<Personnage> trierPersonnages(List<Personnage> liste, String critere) {
  final copie = [...liste];
  copie.sort((a, b) {
    if (critere == 'race') {
      return a.race.compareTo(b.race);
    }
    return a.nom.compareTo(b.nom);
  });
  return copie;
}
