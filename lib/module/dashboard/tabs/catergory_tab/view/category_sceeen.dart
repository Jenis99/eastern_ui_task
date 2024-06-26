import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:eastern_ecommerce_app/utils/formate_utils.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.height, required this.width, required this.homeController});

  final double height;
  final double width;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      // body: categoryItem("demo title", UrlConstant.placeholderImageUrl, Colors.yellow),
      body: ListView.builder(
        itemCount: homeController.categoryDataList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final ShopByCategoryModel categoryModel = homeController.shopByCategoryDataList[index] ?? ShopByCategoryModel();
          return commonCategoryView(categoryModel);
        }, // itemBuilder: () {
      ),
    );
  }

  SizedBox commonCategoryView(ShopByCategoryModel shoeByCategory) {
    return SizedBox(
      height: height * 0.12,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 35),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                width: width * 0.5,
              ),
              Expanded(
                child: Image.network(
                  shoeByCategory.image ?? UrlConstant.placeholderImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
            decoration: BoxDecoration(
                color: Utils.hexToColor(shoeByCategory.tintColor ?? "0xFFFFFF"),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(0, 0), blurRadius: 1, spreadRadius: 1)]),
            width: width * 0.6,
            child: Text(shoeByCategory.name ?? "Category"),
          ),
        ],
      ),
    );
  }
}
