import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String brand,
    required String name,
    required String price,
    required String imageLink,
    required String description,
    required String productType,
    required String productLink,   
  }) : super(
          id: id,
          brand: brand,
          name: name,
          price: price,
          imageLink: imageLink,
          description: description,
          productType: productType,
          productLink: productLink,  
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      imageLink: json['image_link'] ?? '',
      description: json['description'] ?? '',
      productType: json['product_type'] ?? '',
      productLink: json['product_link'] ?? '', 
    );
  }
}
