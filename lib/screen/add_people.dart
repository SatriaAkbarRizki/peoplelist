import 'package:flutter/material.dart';
import 'package:peoplelist/provider/peopleprovider.dart';

import 'package:provider/provider.dart';

import '../model/peoplemodel.dart';

class AddPeople extends StatelessWidget {
  static String routeName = '/addPeople';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  AddPeople({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final peopleProvider = Provider.of<PeopleProvider>(context);
    print('length: ${id}');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            if (nameController.text.isNotEmpty) {
              peopleProvider.addData(id, nameController.text,
                  addressController.text, genderController.text);
            }
            Navigator.pop(context);
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Add new data people'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Address',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: genderController,
              decoration: InputDecoration(
                hintText: 'Gender',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
