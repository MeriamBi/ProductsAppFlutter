import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductViewModel {
  Future<List<Product>> fetchProducts() async {
    const String baseUrl="10.0.2.2:9090";
    http.Response response=await http.get(Uri.http(baseUrl,"/products")).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: "http://$baseUrl/img/${json['image']}",
        yearOfProduction: json['year_of_production'],
        fuelConsumption: json['fuel_consumption'],
        fuelType: json['fuel_type'],
        engine: json['engine'],
      ))
          .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
