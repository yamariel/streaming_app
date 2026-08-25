import 'package:flutter/material.dart';
import 'package:streaming/views/detail_page.dart';
import 'package:streaming/views/grille_emissions.dart';
import '../controllers/emission_controller.dart';

class HomePage extends StatelessWidget {
  final EmissionController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final emission = controller.getEmmissons();
    return Scaffold(
      body: GrilleEmissions(
        emissions: emission,
        onTap: (emission) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(emission: emission),
            ),
          );
        },
      ),
    );
  }
}
