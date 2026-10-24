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
            ],
          );
        },
      ),
    );
  }
}
