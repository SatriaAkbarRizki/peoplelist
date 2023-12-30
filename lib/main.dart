import 'package:flutter/material.dart';
import 'package:peoplelist/provider/peopleprovider.dart';
import 'package:peoplelist/screen/add_people.dart';
import 'package:peoplelist/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PeopleProvider(),
      child: MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: {AddPeople.routeName: (context) => AddPeople()},
        home: const Home(),
      ),
    );
  }
}
