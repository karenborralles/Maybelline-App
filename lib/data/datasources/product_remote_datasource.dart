import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import '../../core/utils/constants.dart';

class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}