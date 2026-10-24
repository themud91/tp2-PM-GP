// liste_provider.dart avec ChangeNotifier de la liste de personnages (etats, recherche et pagination)

//imports
import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../models/personnage.dart';
import '../services/api_service.dart';
import '../services/preferences_service.dart';

// etats de l'ecran
enum EtatListe { chargement, erreur, succes, vide }

//pour gerer la liste son etat et la pag et notifie l'interface avec notifyListeners
class ListeProvider extends ChangeNotifier {
  // services avec getIt
  final ApiService _api = getIt<ApiService>();
  final PreferencesService _prefs = getIt<PreferencesService>();

  // valeur par defaut
  EtatListe _etat = EtatListe.chargement;
  List<Personnage> _personnages = [];
  String _messageErreur = '';
  String _recherche = '';
  int _page = 1;
  bool _chargementPlus = false;
  bool _finListe = false;

  // readOnly
  EtatListe get etat => _etat;
  List<Personnage> get personnages => _personnages;
  String get messageErreur => _messageErreur;
  String get recherche => _recherche;
  bool get chargementPlus => _chargementPlus;

  // lit la derniere recherche avec PreferencesService puis la charger
  ListeProvider() {
    _recherche = _prefs.lireDerniereRecherche();
    charger();
  }

  // methode pour charge la premiere page
  // utilise aussi par le bouton Reessayer
  Future<void> charger() async {
    _page = 1;
    _finListe = false;
    _etat = EtatListe.chargement;
    notifyListeners();

    //gestion d'erreurs
    try {
      // nom nul (String?) si aucune recherche --> l'api renvoie alors la page 1
      String? nom;
      if (_recherche.isNotEmpty) {
        nom = _recherche;
      }
      final liste = await _api.getPersonnages(page: 1, nom: nom);
      _personnages = liste;
      if (liste.isEmpty) {
        _etat = EtatListe.vide;
      } else {
        _etat = EtatListe.succes;
      }
    } catch (e) {
      // on fait un message propre
      _messageErreur = e.toString().replaceFirst('Exception: ', '');
      _etat = EtatListe.erreur;
    }
    notifyListeners();
  }

  // methode qui charge la page suivante
  // charge les 20 personnages suivants quand on arrive au bas de la liste
  Future<void> chargerPlus() async {
    // quand on recherche lapi renvoie tous les resultats et il n'y a pas de pages suivantes
    if (_chargementPlus || _finListe || _recherche.isNotEmpty) {
      return;
    }
    _chargementPlus = true;
    _page++;
    notifyListeners();

    //gestion des erreurs
    try {
      final liste = await _api.getPersonnages(page: _page);
      if (liste.isEmpty) {
        _finListe = true;
      } else {
        _personnages = [..._personnages, ...liste];
      }
    } catch (e) {
      // la liste deja chargee est conservee ensuite on revient a la page precedente
      _page--;
    }
    _chargementPlus = false;
    notifyListeners();
  }

  // memorise la recherche dans shared_preferences et recharge la liste
  Future<void> rechercher(String texte) async {
    _recherche = texte;
    _prefs.ecrireDerniereRecherche(texte);
    await charger();
  }
}
