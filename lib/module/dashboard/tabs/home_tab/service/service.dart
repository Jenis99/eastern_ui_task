import 'dart:convert';

import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<SliderModel?>?> getSliderListData() async {
    try {
      final topUrl = Uri.parse(UrlConstant.top);
      final response = await http.get(topUrl);
      print("getSliderListData call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["main_sticky_menu"];
        if (list == null) return [];
        List<SliderModel> sliderList = list.map((e) => SliderModel.fromJson(e)).toList();

        return sliderList;
      } else {
        print("Something went wrong getSliderListData $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getSliderListData $e $st");
      rethrow;
    }
    return null;
  }

  static Future<List<CategoryModel?>?> getCategoryData() async {
    try {
      final topUrl = Uri.parse(UrlConstant.category);
      final response = await http.get(topUrl);
      print("getCategoryData call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["categories"];
        if (list == null) return null;
        List<CategoryModel> categoryModelList = list.map((e) => CategoryModel.fromJson(e)).toList();
        print("getCategoryData getCategoryData ${categoryModelList.length}");

        return categoryModelList;
      } else {
        print("Something went wrong getCategoryData $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getCategoryData $e $st");
      rethrow;
    }
    return null;
  }

  static Future<List<ShopByCategoryModel?>?> getShopByCategoryModelData() async {
    try {
      final topUrl = Uri.parse(UrlConstant.middle);
      final response = await http.get(topUrl);
      print("getShopByCategoryModelData call response ${response.statusCode} == ${response.body}");

      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["shop_by_category"];
        if (list == null) return null;
        List<ShopByCategoryModel> categoryModelList = list.map((e) => ShopByCategoryModel.fromJson(e)).toList();
        print("getShopByCategoryModelData categoryModelList ${categoryModelList.length}");

        return categoryModelList;
      } else {
        print("Something went wrong in getShopByCategoryModelData $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getShopByCategoryModelData $e $st");
      rethrow;
    }
    return null;
  }

  static Future<List<ProductModel?>?> getRangeOfPattenData() async {
    try {
      final topUrl = Uri.parse(UrlConstant.bottom);
      final response = await http.get(topUrl);
      print("getRangeOfPattenData call response ${response.statusCode} == ${response.body}");
      if (response.statusCode == 200) {
        final List? list = jsonDecode(response.body)["range_of_pattern"];
        if (list == null) return null;
        List<ProductModel> productModelList = list.map((e) => ProductModel.fromJson(e)).toList();
        print("getRangeOfPattenData  productModelList ${productModelList.length}");
        return productModelList;
      } else {
        print("Something went wrong getCategory3 $topUrl ${response.statusCode} ${response.reasonPhrase}");
      }
    } on Exception catch (e, st) {
      print("Error getRangeOfPattenData $e $st");
      rethrow;
    }
    return null;
  }
}
