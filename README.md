# TP2 Prog mobile

## Thème

#Repertoire musicale.

Application de répertoire musical qui permet de consulter, ajouter et afficher en détail des chansons.

## Description du projet

L'application permet de gérer une collection de chansons à travers un modèle Chanson (titre, artiste, genre, tonalité, tempo, durée, accords et notes personnelles).

## Structure

- **Page d'accueil (HomePage)** : affiche la liste des chansons ajoutées, avec un bouton pour ouvrir la page d'ajout.
- **Page de détail (ChansonDetailPage)** : reçoit une chanson en paramètre et affiche ses informations complètes (artiste, genre, tonalité, tempo, durée, accords, notes).
- **Page d'ajout (AjoutChansonPage)** : présente un formulaire pour saisir les informations (et validation) d'une nouvelle chanson, qui est ensuite retournée à la page d'accueil et ajoutée à la liste.

## Attributs de la classe Chanson

- `titre` : String
- `artiste` : String
- `genre` : String
- `tonalite` : String
- `tempoBPM` : int
- `dureeSecondes` : int
- `accords` : List<String>
- `notes` : String

## Contraintes respectées

Toutes les données sont conservées uniquement en List<Chanson> dans le State de HomePage. Aucune base de données, aucun fichier local, aucun appel réseau.

## Fonctionnalité bonus

En plus des exigences de l'énoncé, un bouton de suppression a été ajouté sur chaque élément de la liste (ChansonCard), permettant de retirer une chanson de la collection.

## GitHub

https://github.com/themud91/tp1GP.git
