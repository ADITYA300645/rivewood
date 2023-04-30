import 'dart:io';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rivewood/constants/Constants.dart' as Constants;
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final interactivityProvider = StateProvider<bool>((ref) => false);
final zoomProvider = StateProvider<double>((ref) => 1);
final rotationProvider = StateProvider<double>((ref) => 0);
final threeDModelProvider =
    FutureProvider.family<Object, String>((ref, productId) async {
  Dio _dio = Dio();
  var mtlResponse = await _dio.get(Constants.productMtlModelUrl(productId));
  var objResponse = await _dio.get(Constants.productObjModelUrl(productId));
  Directory tempLocation = await getApplicationDocumentsDirectory();
  var objFile = await File("${tempLocation.path}/${productId}.obj")
      .writeAsString(objResponse.data);
  var mtlFile = await File("${tempLocation.path}/${productId}.mtl")
      .writeAsString(mtlResponse.data);
  var object = await Object(
      rotation: Vector3(10, 10, 0),
      visiable: true,
      scene: Scene(),
      lighting: true,
      name: "${productId}",
      fileName: objFile.path,
      isAsset: false);
  return object;
});
