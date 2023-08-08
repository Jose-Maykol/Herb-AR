import 'package:flutter/material.dart';
import 'package:herb_ar/constants.dart';
import 'package:herb_ar/models/plant.dart';
import 'package:herb_ar/screens/plant_ar.dart';

class PlantDetail extends StatelessWidget {
  final Plant plant;

  const PlantDetail({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herb AR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(plant.imageUrl ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlantAR()),
                    );
                  },
                  child: const Text('Ver en AR'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nombre común:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: verde500),
                ),
                const SizedBox(height: 16),
                Text(
                  plant.commonName ?? 'Unknown',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nombre científico:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: verde500),
                ),
                const SizedBox(height: 16),
                Text(
                  plant.scientificName ?? 'Unknown',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Descripción:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: verde500),
                ),
                const SizedBox(height: 16),
                Text(
                  plant.description ?? 'No description available.',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Propiedades medicinales:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: verde500),
                ),
                const SizedBox(height: 16),
                Text(
                  plant.medicinalProperties ?? 'No description available.',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
