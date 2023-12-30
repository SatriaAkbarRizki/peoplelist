import 'package:dio/dio.dart';

import '../model/peoplemodel.dart';

class PeopleDataService {
  final dio = Dio();
  final baseUrl = "https://658d23df7c48dce9473892eb.mockapi.io/foodapi";
  // List<PeopleModel> _list = [];
  Future<List<PeopleModel>?> fetchData() async {
    final response = await dio.get(baseUrl);

    try {
      if (response.statusCode != 200) {
        return null; // or handle the error accordingly
      } else {
        final List<dynamic> data = response.data;
        return data.map((e) => PeopleModel.fromJson(e)).toList();
      }
    } catch (e) {
      print('Error message: ${e.toString()}');
    }
    return null;
  }

  Future addData(String id, PeopleModel peopleModel) async {
    await dio.post(baseUrl, data: peopleModel.toJson());
  }

  Future removeData(String id) async {
    try {
      await dio.delete('$baseUrl/$id');
    } catch (e) {
      print(e.toString());
    }
  }
}
