import '../models/emission.dart';

class EmissionController {
  //créer une liste d'emmisons
  List<Emission> emmissions = [
    Emission(
      id: 1, 
      nom: "Match de gala", 
      chaine: "Ariel+ Sport", 
      image: "https://picsum.photos/500/300?random=1",
    ),

    Emission(
      id: 2, 
      nom: "Bob l'éponge", 
      chaine: "Baby Chanel", 
      image: "https://picsum.photos/500/300?random=2",
    ),

    Emission(
      id: 3, 
      nom: "Dance Challenge", 
      chaine: "VoiceXP", 
      image: "https://picsum.photos/500/300?random=3",
    ),

    Emission(
      id: 4, 
      nom: "Google I/O", 
      chaine: "Google", 
      image: "https://picsum.photos/500/300?random=4",
    ),

    Emission(
      id: 5, 
      nom: "DotJS", 
      chaine: "Dev Fest", 
      image: "https://picsum.photos/500/300?random=5",
    ),

    Emission(
      id: 6, 
      nom: "Free man", 
      chaine: "SuperHero", 
      image: "https://picsum.photos/500/300?random=6",
    ),
  ];

  //retourne la liste des émmissons
  List<Emission> getEmmissons() {
    return emmissions;
  }

  //retourne l'emmission selectionner
  Emission onEmissionSelected(Emission emission) {
    return emission;
  }
}