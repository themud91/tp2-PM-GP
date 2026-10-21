// ce fichier sert a lire et ecrire des preferences avec les shared_preferences
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _prefs;
  PreferencesService(this._prefs);

  //les keys
  static const String _cleTheme = 'theme_sombre';
  static const String _cleTri = 'tri_par_defaut';

  // lit le theme sauvegarde sinon false (clair) si rien nest encore sauvegarde
  bool lireThemeSombre() {
    final valeur = _prefs.getBool(_cleTheme);
    if (valeur == null) {
      return false;
    }
    return valeur;
  }

  // lit le tri sauvegarde sinon nom et si rien n'est encore sauvegarde
  String lireTriParDefaut() {
    final valeur = _prefs.getString(_cleTri);
    if (valeur == null) {
      return 'nom';
    }
    return valeur;
  }

  // sauvegarde le theme
  void ecrireThemeSombre(bool valeur) {
    _prefs.setBool(_cleTheme, valeur);
  }

  // sauvegarde le tri
  void ecrireTriParDefaut(String valeur) {
    _prefs.setString(_cleTri, valeur);
  }
}
