import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';

class ShopByFabricMaterialView extends StatelessWidget {
  const ShopByFabricMaterialView({super.key, required this.height, required this.width, required this.homeController});

  final double height;
  final double width;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      child: GridView.builder(
          itemCount: homeController.productDataList.length ?? 10,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final ProductModel productModel = homeController.productDataList[index] ?? ProductModel();

            return shopByFabricMaterial(productModel);
          }),
    );
  }

  Widget shopByFabricMaterial(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(productModel.image ?? UrlConstant.placeholderImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        productModel.name ?? "COTTON",
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(backgroundColor: Colors.black.withOpacity(0.2), color: Colors.white, fontSize: 10),
      ),
    );
  }
}
