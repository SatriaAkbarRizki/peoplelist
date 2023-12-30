import 'package:flutter/material.dart';
import 'package:peoplelist/model/peoplemodel.dart';
import 'package:peoplelist/provider/peopleprovider.dart';
import 'package:provider/provider.dart';

class ListPeople extends StatelessWidget {
  const ListPeople({super.key});

  @override
  Widget build(BuildContext context) {
    final listPeople = Provider.of<PeopleProvider>(context);
    final getListPeople = listPeople.list;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: getListPeople.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: getListPeople[index],
                child: const CardPeople(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardPeople extends StatelessWidget {
  const CardPeople({super.key});

  @override
  Widget build(BuildContext context) {
    print('REBUILD WIDGET ON CARDPOEPLE');

    final getListPeople = Provider.of<PeopleModel>(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: ListTile(
          leading: Text(getListPeople.id!),
          title: Text(getListPeople.name!),
          subtitle: Text(getListPeople.address!),
          trailing: Consumer<PeopleProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.removeData(getListPeople.id!);
                },
                icon: const Icon(Icons.delete)),
          ),
        ),
      ),
    );
  }
}
