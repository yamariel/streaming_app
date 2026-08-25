import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../models/emission.dart';
import 'carte_emission.dart';

class GrilleEmissions extends StatelessWidget {
  final List<Emission> emissions;
  final Function(Emission) onTap;

  const GrilleEmissions({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ResponsiveGridList(
        desiredItemWidth: 150.0,
        minSpacing: 16,
        children: [
          ...emissions.map((emission) {
            return CarteEmission(
              emission: emission,
              onTap: () {
                onTap(emission);
              },
            );
          }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
