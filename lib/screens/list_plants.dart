import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herb_ar/models/plant.dart';

class PlantList extends StatelessWidget {
  const PlantList({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herb AR'),
      ),
      body: FutureBuilder<List<Plant>>(
        future: fetchAllPlants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<Plant> plants = snapshot.data!;
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                Plant plant = plants[index];
                return ListTile(
                  leading: Container(
                    width: 50, // Ancho de la imagen
                    height: 50, // Alto de la imagen
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(plant.imageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(plant.commonName ?? 'Unknown'),
                  subtitle: Text(plant.scientificName ?? 'Unknown'),
                );
              },
            );
          } else {
            return const Text('No data available.');
          }
        },
      ),
    );
  }
}

Future<List<Plant>> fetchAllPlants() async {
  try {
    QuerySnapshot plantSnapshot =
        await FirebaseFirestore.instance.collection('plants').get();

    List<Plant> plants = [];
    for (QueryDocumentSnapshot doc in plantSnapshot.docs) {
      plants.add(Plant.fromJson(doc.data() as Map<String, dynamic>));
    }

    return plants;
  } catch (e) {
    throw Exception('Failed to fetch plants: $e');
  }
}




