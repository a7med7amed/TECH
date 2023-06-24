import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable {
  final String? brand;
  final String? title;
  final String? description;
  final int? price;
  final double? rating;
  final String? thumbnail;
  final String? type;
  final int? id;

  const DeviceModel({
    this.brand,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.thumbnail,
    this.type,
    this.id,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> data) => DeviceModel(
        brand: data['brand'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        price: data['price'] as int?,
        rating: (data['rating'] as num?)?.toDouble(),
        thumbnail: data['thumbnail'] as String?,
        type: data['type'] as String?,
        id: data['id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'brand': brand,
        'title': title,
        'description': description,
        'price': price,
        'rating': rating,
        'thumbnail': thumbnail,
        'type': type,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeviceModel].
  factory DeviceModel.fromJson(String data) {
    return DeviceModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeviceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      brand,
      title,
      description,
      price,
      rating,
      thumbnail,
      type,
      id,
    ];
  }
}
