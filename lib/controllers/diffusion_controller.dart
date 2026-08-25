import 'dart:math';

import '../models/diffusion.dart';

class DiffusionController {
  // Génère quelques diffusions aléatoires
  List<Diffusion> genererDiffusions() {
    final random = Random();

    final noms = [
      "Morning Live",
      "Music Time",
      "Afro Hits",
      "Top Musique",
      "Flash Info",
      "Night Show",
      "Mix du soir",
    ];

    return List.generate(6, (index) {
      final date = DateTime.now().subtract(Duration(days: random.nextInt(30)));

      final duree = 30 + random.nextInt(91);

      return Diffusion(
        nom: noms[random.nextInt(noms.length)],
        date: date,
        duree: duree,
      );
    });
  }

  //formatage de la date
  String formaterDate(DateTime date) {
    return "${date.day.toString()}/"
        "${date.month.toString()}/"
        "${date.year}";
  }

  //formatage de la durée
  String formaterDuree(int minutes) {
    final heures = minutes ~/ 60;
    final minutesRestantes = minutes % 60;

    if (heures > 0) {
      return "${heures}h ${minutesRestantes}min";
    }

    return "$minutesRestantes min";
  }
}
