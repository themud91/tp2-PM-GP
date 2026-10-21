// inspire de l'example class Recette {} dans l'ennonce du TP

class Chanson {
  final String titre;
  final String artiste;
  final String genre;
  final String tonalite;
  final int tempoBPM;
  final int dureeSecondes;
  final List<String> accords;
  final String notes;

  //constructeur
  Chanson({
    required this.titre,
    required this.artiste,
    required this.tonalite,
    required this.tempoBPM,
    required this.dureeSecondes,
    required this.genre,
    required this.accords,
    required this.notes,
  });
}
