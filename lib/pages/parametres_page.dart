// page des reglage theme et tri par defaut

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/parametres_provider.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parametres')),
      body: Consumer<ParametresProvider>(
        builder: (context, parametres, child) {
          return Column(
            children: [
              SwitchListTile(
                title: const Text('Theme sombre'),
                value: parametres.themeSombre,
                onChanged: parametres.changerTheme,
              ),

              // menu deroulant pour choisir le tri.
              // api.flutter.dev/flutter/material/DropdownButton-class.html
              ListTile(
                title: const Text('Tri par défaut'),
                trailing: DropdownButton<String>(
                  value: parametres.triParDefaut,
                  items: const [
                    DropdownMenuItem(value: 'nom', child: Text('Nom')),
                    DropdownMenuItem(value: 'race', child: Text('Race')),
                  ],
                  onChanged: (valeur) {
                    if (valeur != null) {
                      parametres.changerTri(valeur);
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
