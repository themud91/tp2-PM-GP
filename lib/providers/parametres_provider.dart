// parametres_provider.dart, ChangeNotifier des reglages, theme, tri par defaut, synchronises avec shared_preferences

import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../services/preferences_service.dart';

// Lit et ecrit les preferences via PreferencesService et notify l'interface avec notifyListeners
class ParametresProvider extends ChangeNotifier {
  //le servicio obtenu avec getIt
  final PreferencesService _prefs = getIt<PreferencesService>();

  //2 champs private avec valeur par defaut
  bool _themeSombre = false;
  String _triParDefaut = 'nom';

  //pour lire sans modifier
  bool get themeSombre => _themeSombre;
  String get triParDefaut => _triParDefaut;

  // get let preferences... ATENCION: CREAR LES METODOS lireThemeSombre() y lireTriParDefaut();
  ParametresProvider() {
    _themeSombre = _prefs.lireThemeSombre();
    _triParDefaut = _prefs.lireTriParDefaut();
  }

  // change le theme le sauvegarde dans shared_preferences et notify
  void changerTheme(bool valeur) {
    _themeSombre = valeur;
    _prefs.ecrireThemeSombre(valeur);
    notifyListeners();
  }

  // change le tri par defaut et le sauvegarde dans shared_preferences et notify
  void changerTri(String valeur) {
    _triParDefaut = valeur;
    _prefs.ecrireTriParDefaut(valeur);
    notifyListeners();
  }
}
