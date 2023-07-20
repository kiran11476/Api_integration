// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  int? id;
  String? name;
  String? neighborhood;
  String? photograph;
  String? address;
  ItemModel({
    this.id,
    this.neighborhood,
    this.photograph,
    this.address,
  });

  ItemModel copyWith({
    int? id,
    String? neighborhood,
    String? photograph,
    String? address,
  }) {
    return ItemModel(
      id: id ?? this.id,
      neighborhood: neighborhood ?? this.neighborhood,
      photograph: photograph ?? this.photograph,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'neighborhood': neighborhood,
      'photograph': photograph,
      'address': address,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] != null ? map['id'] as int : null,
      neighborhood:
          map['neighborhood'] != null ? map['neighborhood'] as String : null,
      photograph:
          map['photograph'] != null ? map['photograph'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, neighborhood: $neighborhood, photograph: $photograph, address: $address)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.neighborhood == neighborhood &&
        other.photograph == photograph &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        neighborhood.hashCode ^
        photograph.hashCode ^
        address.hashCode;
  }
}
