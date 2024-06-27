import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:eastern_ecommerce_app/utils/format_utils.dart';
import 'package:flutter/material.dart';

class ShopByCategoryView extends StatelessWidget {
  const ShopByCategoryView({super.key, required this.height, required this.width, required this.homeController, required this.whichCategory});

  final double height;
  final double width;
  final int whichCategory;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final isFirstCategory = whichCategory == 0;
    return SizedBox(
      height: height * 0.5,
      child: GridView.builder(
          itemCount: whichCategory == 0 ? homeController.shopByCategoryDataList.length : homeController.categoryDataList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return thirdCommonBox(
              width,
              height,
              isFirstCategory,
              subCategoryModel: isFirstCategory ? SubCategoryModel() : homeController.categoryDataList.first?.child?[index] ?? SubCategoryModel(),
              shopByCategoryModel: isFirstCategory ? homeController.shopByCategoryDataList[index] ?? ShopByCategoryModel() : ShopByCategoryModel(),
            );
          }),
    );
  }

  /// Shop by category
  Widget thirdCommonBox(double width, double height, bool isFirstCategory,
      {ShopByCategoryModel? shopByCategoryModel, SubCategoryModel? subCategoryModel}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          isFirstCategory
              ? shopByCategoryModel?.image ?? UrlConstant.placeholderImageUrl
              : /*subCategoryModel?.categoryName ??*/ UrlConstant.placeholderImageUrl,
          fit: BoxFit.cover,
          width: width * 0.40,
          height: height * 0.17,
        ),
        Container(
          alignment: Alignment.centerLeft,
          color: isFirstCategory ? Utils.hexToColor(shopByCategoryModel?.tintColor ?? "0xfffff") : Colors.white,
          width: width * 0.40,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
          // width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isFirstCategory ? shopByCategoryModel?.name ?? "" : subCategoryModel?.categoryName ?? "Explore",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 11),
              ),
              Text(
                "Explore ${isFirstCategory ? shopByCategoryModel?.sortOrder ?? "" : subCategoryModel?.categoryId ?? 1}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
