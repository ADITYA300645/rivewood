import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rivewood/core/Models/Product.dart';
import 'package:rivewood/constants/Constants.dart' as Constants;

final productProvider = FutureProvider.family<Product, String>((ref, id) async {
  Dio _dio = Dio();
  var response = await _dio.get("${Constants.Url}/products/product/$id");
  return Product.fromJson(response.data);
});
