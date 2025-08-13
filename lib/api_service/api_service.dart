import 'dart:convert';
import 'package:free_course/model/brand_list.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class ApiService {
  static const String baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String category = '/CategoryList';
  static const String brandList = '/BrandList';

  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse('$baseUrl$category');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded != null && decoded['data'] is List) {
          final List<dynamic> data = decoded['data'];

          return data
              .map((item) => Category.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception('Invalid data format from API');
        }
      } else {
        throw Exception('Failed to fetch categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
  Future<List<BrandList>> fetchBrandList() async {
    final url = Uri.parse('$baseUrl$brandList');

    try {
      /// Postman hitting
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // print(response);
        final decoded = jsonDecode(response.body);

        if (decoded != null && decoded['data'] is List) {
          final List<dynamic> data = decoded['data'];

          List<BrandList> brands = data
              .map((item) => BrandList.fromJson(item as Map<String, dynamic>))
              .toList();

          // 🔵 Print brand values in console
          print("=== Brand List (${brands.length}) ===");
          for (var brand in brands) {
            print("ID: ${brand.id}");
            print("Name: ${brand.brandName}");
            print("Image URL: ${brand.brandImg}");
            print("---------------------------");}
            return brands;
        } else {
          throw Exception('Invalid data format from API');
        }
      } else {
        throw Exception('Failed to fetch categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
