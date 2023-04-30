import 'package:rivewood/constants/Constants.dart' as Constants;
import 'package:dio/dio.dart';

Future<List<String>> getNewArrivals() async {
  Dio _dio = Dio();
  var response = await _dio.get("${Constants.Url}/products");
  List<String> newArrivals = [];
  response.data["products"].forEach((e) => {newArrivals.add(e["_id"])});
  return newArrivals;
}
