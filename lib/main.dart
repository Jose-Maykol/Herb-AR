import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herb_ar/constants.dart';
import 'package:herb_ar/screens/list_plants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herb AR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: verde400
        ),
      ),
      home: const PlantList(),
    );
  }
}
