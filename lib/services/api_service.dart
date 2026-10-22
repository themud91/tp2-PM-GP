// api_service.dart classe abstraite du service d'acces a l'API
// permet de remplacer l'implementation reelle  dans les tests

import '../models/personnage.dart';

abstract class ApiService {
  // retourne une page de personnages, nom sert a filtrer par recherche
  Future<List<Personnage>> getPersonnages({int page = 1, String? nom});
}
