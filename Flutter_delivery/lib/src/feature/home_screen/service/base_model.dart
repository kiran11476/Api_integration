// To parse this JSON data, do
//
//     final baseModel = baseModelFromMap(jsonString);

import 'dart:convert';

class BaseModel {
  dynamic model;
  int? status;
  String? message;
  bool? succeeded;
  BaseModel({
    required this.model,
    required this.status,
    required this.message,
    required this.succeeded,
  });

  factory BaseModel.fromJson(String str) => BaseModel.fromMap(json.decode(str));

  factory BaseModel.fromMap(Map<String, dynamic> json) => BaseModel(
        model: json["model"],
        status: json["status"],
        message: json["message"],
        succeeded: json["succeeded"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "model": model.toMap(),
        "status": status,
        "message": message,
        "succeeded": succeeded,
      };
}
