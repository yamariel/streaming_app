import 'package:flutter/material.dart';

import '../controllers/diffusion_controller.dart';
import '../models/emission.dart';

class DetailPage extends StatelessWidget {
  final Emission emission;
  const DetailPage({super.key, required this.emission});
  @override
  Widget build(BuildContext context) {
    final diffusionsControllers = DiffusionController();
    final diffusions = diffusionsControllers.genererDiffusions();
    final formatage = diffusionsControllers;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Streaming"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image avec Hero
          Hero(
            tag: emission.image,
            child: Image.network(
              emission.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,

              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const SizedBox(
                  height: 300,
                  child: Center(child: CircularProgressIndicator()),
                );
              },

              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 300,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          // Informations sur l'émission
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Colors.purple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  emission.nom,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(Icons.radio, color: Colors.white70, size: 20),

                    const SizedBox(width: 6),

                    Text(
                      emission.chaine,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text(
              "Diffusions",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // Liste des diffusions
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: diffusions.length,
              itemBuilder: (context, index) {
                final diffusion = diffusions[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),

                    // Bouton volume
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        shape: BoxShape.circle,
                      ),

                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.volume_up, color: Colors.purple),
                      ),
                    ),

                    // Nom de la diffusion
                    title: Text(
                      diffusion.nom,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    // Date + durée
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 15,
                            color: Colors.grey,
                          ),

                          const SizedBox(width: 5),

                          Text(
                            formatage.formaterDate(diffusion.date),
                            style: const TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(width: 15),

                          const Icon(
                            Icons.access_time,
                            size: 15,
                            color: Colors.grey,
                          ),

                          const SizedBox(width: 5),

                          Text(
                            formatage.formaterDuree(diffusion.duree),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    trailing: const Icon(
                      Icons.play_circle_outline,
                      color: Colors.purple,
                      size: 30,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
