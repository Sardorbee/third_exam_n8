import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:third_exam/services/model/category_model.dart';
import 'package:third_exam/services/model/product_model.dart';
import 'package:third_exam/services/model/products_by_id.dart';
import 'package:third_exam/services/model/universal.dart';
import 'package:http/http.dart' as http;
import 'package:third_exam/services/network/api_utils.dart';

class ApiProvider {
  static Future<UniversalData> getBYCategory() async {
    String url = 'https://imtixon.free.mockoapp.net/categories';

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<CategoryModel> categories = jsonData
            .map((jsonObject) => CategoryModel.fromJson(jsonObject))
            .toList();

        return UniversalData(data: categories);
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(
          error: "Internet bilan ulanishda XATOLIK sodir bo'ldi!!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR: $err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getbyID({
    required int? id,
  }) async {
    String url =
        'https://imtixon.free.mockoapp.net/categories/${id.toString()}';

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        
        List<dynamic> jsonData = jsonDecode(response.body);
        
        List<ProductModelById> categories = jsonData
            .map((jsonObject) => ProductModelById.fromJson(jsonObject))
            .toList();

        return UniversalData(data: categories);
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(
          error: "Internet bilan ulanishda XATOLIK sodir bo'ldi!!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR: $err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getAllProducts() async {
    String url = 'https://imtixon.free.mockoapp.net/products';

    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(
          error: "Internet bilan ulanishda XATOLIK sodir bo'ldi!!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }
}
