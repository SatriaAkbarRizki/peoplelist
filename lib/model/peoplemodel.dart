import 'dart:convert';

import 'package:flutter/material.dart';

class PeopleModel with ChangeNotifier {
  String? id;
  String? name;
  String? address;
  String? gender;
  String? createdAt;

  PeopleModel({
    required this.id,
    required this.name,
    required this.address,
    required this.gender,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }

    return result;
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      gender: map['gender'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(Map<String, dynamic> map) {
    return PeopleModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }
}
