// locator.dart fait des enregistrement et centralise des services dans get_it qui appele une seule fois au demarrage

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/preferences_service.dart';
import 'services/api_service.dart';
import 'services/dragon_ball_api_service.dart';
import 'services/database_service.dart';

//pour get les services
final getIt = GetIt.instance;

// Enregistre PreferencesService, ApiService et DatabaseService dans get_it.
// Appelee avec await dans main() avant runApp, pour que les providers
// puissent recuperer les services avec getIt<Type>().
Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();

  // singleton parce q l'objet existe deja (await fait)
  getIt.registerSingleton<PreferencesService>(PreferencesService(prefs));
  // lazySingleton cree au premier acces seulement une seule instance
  getIt.registerLazySingleton<ApiService>(() => DragonBallApiService());

  // la base SQLite s'ouvre seulement quand on en a besoin
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
}
