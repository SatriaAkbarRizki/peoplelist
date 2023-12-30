import 'package:flutter/material.dart';
import 'package:peoplelist/model/peoplemodel.dart';
import 'package:peoplelist/services/data_services.dart';

class PeopleProvider with ChangeNotifier {
  final _peopleData = PeopleDataService();

  bool isLoading = false;
  List<PeopleModel> _list = [];
  List<PeopleModel> get list => _list;

  Future getAllData() async {
    final data = await _peopleData.fetchData();
    _list = data!;
    return _list;
  }

  void addData(String id, String name, String address, String gender) async {
    int sum = int.parse(id) + 1;

    PeopleModel peopleModel = PeopleModel(
        id: sum.toString(),
        name: name,
        address: address,
        gender: gender,
        createdAt: DateTime.now().toString());

    list.add(peopleModel);
    await _peopleData.addData(sum.toString(), peopleModel);
    notifyListeners();
  }

  void removeData(String id) async {
    // remove data on local
    list.removeWhere((element) => element.id == id);

    // remove data on api
    await _peopleData.removeData(id);
    print('list: ${list.length}');
    notifyListeners();
  }
}
