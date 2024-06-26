import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:eastern_ecommerce_app/utils/formate_utils.dart';
import 'package:flutter/material.dart';

class Shopbycategoryview extends StatelessWidget {
  const Shopbycategoryview({Key? key, required this.height, required this.width, required this.homeController, required this.whichCategory})
      : super(key: key);
  final double height;
  final double width;
  final int whichCategory;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
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
              whichCategory,
              category: CategoryModel(),
              shopByCategoryModel: homeController.shopByCategoryDataList[index] ?? ShopByCategoryModel(),
            );
          }),
    );
  }

  /// Shop by category
  Widget thirdCommonBox(double width, double height, int whichCategory, {ShopByCategoryModel? shopByCategoryModel, CategoryModel? category}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          whichCategory == 0
              ? shopByCategoryModel?.image ?? UrlConstant.placeholderImageUrl
              : category?.categoryName ?? UrlConstant.placeholderImageUrl,
          fit: BoxFit.cover,
          width: width * 0.40,
          height: height * 0.17,
        ),
        Container(
          alignment: Alignment.centerLeft,
          color: whichCategory == 0 ? Utils.hexToColor(shopByCategoryModel?.tintColor ?? "0xfffff") : Colors.white,
          width: width * 0.40,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
          // width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shopByCategoryModel?.name ?? category?.categoryName ?? "Explore",
                  textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 11)),
              Text("Explore ${shopByCategoryModel?.sortOrder ?? category?.categoryId ?? 1}",
                  textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
