// dragon_ball_api_service.dart implementation reelle de ApiService avec http pour la Dragon Ball api

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/personnage.dart';
import 'api_service.dart';

//class pour le api service
class DragonBallApiService implements ApiService {
  static const String _urlBase = 'https://dragonball-api.com/api/characters';

  @override
  Future<List<Personnage>> getPersonnages({int page = 1, String? nom}) async {
    final Uri url;
    if (nom != null) {
      url = Uri.parse('$_urlBase?name=${Uri.encodeQueryComponent(nom)}');
    } else {
      url = Uri.parse('$_urlBase?page=$page&limit=20');
    }

    //en repondant la consigne: "lance une exception claire en cas d'erreur (code HTTP different de 200, absence de réseau, JSON invalide)"
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw Exception('Erreur serveur : code ${response.statusCode}');
      }

      final decode = jsonDecode(response.body);
      final List<dynamic> liste;
      if (decode is Map) {
        liste = decode['items'] as List<dynamic>;
      } else {
        liste = decode as List<dynamic>;
      }

      return liste
          .map((e) => Personnage.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      // si pas de reseau
      throw Exception('Pas de connexion Internet');
    } on TimeoutException {
      // le serveur met trop de temps
      throw Exception('Le serveur ne repond pas');
    } on FormatException {
      // si le texte recu n'est pas du json
      throw Exception('Reponse invalide du serveur (JSON incorrect)');
    } on TypeError {
      // le json n'a pas la structure correcte
      throw Exception('Reponse invalide du serveur (structure inattendue)');
    }
  }
}
