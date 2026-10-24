//imports

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'providers/parametres_provider.dart';

//import 'providers/favoris_provider.dart';
//import 'providers/liste_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // le widget root
    // avec style, theme et shape
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParametresProvider()),
        // ChangeNotifierProvider(create: (_) => FavorisProvider()),
        // ChangeNotifierProvider(create: (_) => ListeProvider()),
      ],
      // Consumer ecoute ParametresProvider pour changer le theme en direct
      child: Consumer<ParametresProvider>(
        builder: (context, parametres, _) {
          return MaterialApp(
            title: 'Dragon Ball',
            // theme clair, meme seedColor
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 87, 43, 165),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 87, 43, 165),
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            // theme sombre

            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 87, 43, 165),
                //theme "dark"
                brightness: Brightness.dark,
              ),

              //background main page
              scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
              appBarTheme: const AppBarTheme(
                //couleur barre du haut
                backgroundColor: Color.fromARGB(255, 87, 43, 165),
                //couleur du texte/icones
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            themeMode: parametres.themeSombre
                ? ThemeMode.dark
                : ThemeMode.light,

            home: const Scaffold(body: Center(child: Text('TP2'))),
          );
        },
      ),
    );
  }
}
