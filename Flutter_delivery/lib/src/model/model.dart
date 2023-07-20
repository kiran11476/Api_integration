// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'items_model.dart';

class RestaurantModel {
  List<ItemModel>? items;
  RestaurantModel({
    this.items,
  });

  RestaurantModel copyWith({
    List<ItemModel>? items,
  }) {
    return RestaurantModel(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      items: map['items'] != null
          ? List<ItemModel>.from(
              (map['items'] as List<int>).map<ItemModel?>(
                (x) => ItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RestaurantModel(items: $items)';

  @override
  bool operator ==(covariant RestaurantModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
