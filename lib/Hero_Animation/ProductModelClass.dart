import 'dart:convert';

// ignore_for_file: file_names

class Product {
  String name;
  String imageURl;
  String rent;
  String feature1;
  String feature2;
  String feature3;
  String description;
  
  Product({
    required this.name,
    required this.imageURl,
    required this.rent,
    required this.feature1,
    required this.feature2,
    required this.feature3,
    required this.description,
  });


  Product copyWith({
    String? name,
    String? imageURl,
    String? rent,
    String? feature1,
    String? feature2,
    String? feature3,
    String? description,
  }) {
    return Product(
      name: name ?? this.name,
      imageURl: imageURl ?? this.imageURl,
      rent: rent ?? this.rent,
      feature1: feature1 ?? this.feature1,
      feature2: feature2 ?? this.feature2,
      feature3: feature3 ?? this.feature3,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageURl': imageURl,
      'rent': rent,
      'feature1': feature1,
      'feature2': feature2,
      'feature3': feature3,
      'description': description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      imageURl: map['imageURl'],
      rent: map['rent'],
      feature1: map['feature1'],
      feature2: map['feature2'],
      feature3: map['feature3'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, imageURl: $imageURl, rent: $rent, feature1: $feature1, feature2: $feature2, feature3: $feature3, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.name == name &&
      other.imageURl == imageURl &&
      other.rent == rent &&
      other.feature1 == feature1 &&
      other.feature2 == feature2 &&
      other.feature3 == feature3 &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      imageURl.hashCode ^
      rent.hashCode ^
      feature1.hashCode ^
      feature2.hashCode ^
      feature3.hashCode ^
      description.hashCode;
  }
}
