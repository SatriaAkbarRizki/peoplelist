import 'package:flutter/material.dart';
import 'package:peoplelist/provider/peopleprovider.dart';
import 'package:peoplelist/screen/add_people.dart';
import 'package:peoplelist/widget/widget_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('REBUILD WIDGET ON HOME');
    final peopleProvider = Provider.of<PeopleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Learning API using Provider'),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            Navigator.pushNamed(context, AddPeople.routeName,
                arguments: peopleProvider.list.last.id.toString());
          },
          child: Icon(Icons.add)),
      body: FutureBuilder(
        future: peopleProvider.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const ListPeople();
          } else {
            return const Center(
              child: Text('No have data'),
            );
          }
        },
      ),
    );
  }
}
