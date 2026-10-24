// page personnage.dart modele d'un personnage de Dragon Ball
// aucune logique base de donnees ici seulement conversion des donnees

//creationdu class
class Personnage {
  final int id;
  final String nom;
  final String image;
  final String race;
  final String genre;
  final String ki;
  final String maxKi;
  final String description;
  final String affiliation;

  // champs locals (SQLite) RAPPEL: nuls quand le personnage vient de lapi
  final String? notePerso;
  final String? dateAjout;

  const Personnage({
    required this.id,
    required this.nom,
    required this.image,
    required this.race,
    required this.genre,
    required this.ki,
    required this.maxKi,
    required this.description,
    required this.affiliation,

    this.notePerso,
    this.dateAjout,
  });

  // retourne le texte recu ou la valeur par defaut si c'est nul
  static String _texte(dynamic valeur, String defaut) {
    if (valeur == null) {
      return defaut;
    }
    return valeur as String;
  }

  //factory constructeur
  // cree un personnage a partir du json de l'api... les champs nuls == unknown
  factory Personnage.fromJson(Map<String, dynamic> json) {
    return Personnage(
      id: json['id'] as int,
      nom: _texte(json['name'], 'unknown'),
      image: _texte(json['image'], ''),
      race: _texte(json['race'], 'unknown'),
      genre: _texte(json['gender'], 'unknown'),
      ki: _texte(json['ki'], 'unknown'),
      maxKi: _texte(json['maxKi'], 'unknown'),
      description: _texte(json['description'], ''),
      affiliation: _texte(json['affiliation'], 'unknown'),
    );
  }

  // pour la BD, les colonnes de la table favoris (tous les champs du personnage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'image': image,
      'race': race,
      'genre': genre,
      'ki': ki,
      'max_ki': maxKi,
      'description': description,
      'affiliation': affiliation,

      'note_perso': notePerso,
      'date_ajout': dateAjout,
    };
  }

  // lit une ligne de la table favoris
  factory Personnage.fromMap(Map<String, dynamic> map) {
    return Personnage(
      id: map['id'] as int,
      nom: _texte(map['nom'], 'unknown'),
      image: _texte(map['image'], ''),
      race: _texte(map['race'], 'unknown'),
      genre: _texte(map['genre'], 'unknown'),
      ki: _texte(map['ki'], 'unknown'),
      maxKi: _texte(map['max_ki'], 'unknown'),
      description: _texte(map['description'], ''),
      affiliation: _texte(map['affiliation'], 'unknown'),

      notePerso: map['note_perso'] as String?,
      dateAjout: map['date_ajout'] as String?,
    );
  }
}
