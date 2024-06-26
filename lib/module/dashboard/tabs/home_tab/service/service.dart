import 'dart:convert';

import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<SliderModel?>?> getCategory() async {
    try {
      final topUrl = Uri.parse(UrlConstant.top);
      final response = await http.get(topUrl);
      print("getCategory call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["main_sticky_menu"];
        if (list == null) return [];
        List<SliderModel> sliderList = list
            .map(
              (e) => SliderModel.fromJson(e),
            )
            .toList();

        return sliderList;
      } else {
        print("Something went wrong getCategory $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getCategory $e $st");
    }
  }

  static Future<List<CategoryModel?>?> getCategory1() async {
    try {
      final topUrl = Uri.parse(UrlConstant.category);
      final response = await http.get(topUrl);
      print("getCategory1 call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["categories"];
        if (list == null) return null;
        List<CategoryModel> categoryModelList = list
            .map(
              (e) => CategoryModel.fromJson(e),
            )
            .toList();
        print("getCategory1  categoryModelList1 ${categoryModelList.length}");

        return categoryModelList;
      } else {
        print("Something went wrong getCategory2 $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getCategory1 $e $st");
    }
    return null;
  }

  static Future<List<ShopByCategoryModel?>?> getCategory2() async {
    try {
      final topUrl = Uri.parse(UrlConstant.middle);
      final response = await http.get(topUrl);
      print("getCategory2 call response ${response.statusCode} == ${response.body}");

      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["shop_by_category"];
        if (list == null) return null;
        List<ShopByCategoryModel> categoryModelList = list
            .map(
              (e) => ShopByCategoryModel.fromJson(e),
            )
            .toList();
        print("getCategory2  categoryModelList ${categoryModelList.length}");

        return categoryModelList;
      } else {
        print("Something went wrong $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getCategory2 $e $st");
    }
  }

  static Future<List<ProductModel?>?> getCategory3() async {
    try {
      final topUrl = Uri.parse(UrlConstant.bottom);
      final response = await http.get(topUrl);
      print("getCategory3 call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["range_of_pattern"];
        if (list == null) return null;
        List<ProductModel> productModelList = list
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        print("getCategory3  productModelList ${productModelList.length}");
        return productModelList;
      } else {
        print("Something went wrong getCategory3 $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getCategory3 $e $st");
    }
  }
}
