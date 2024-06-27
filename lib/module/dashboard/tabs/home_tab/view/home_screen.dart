import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/common_widget/carousel_slider_view.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/common_widget/first_common_box.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/common_widget/shopByCategoryView.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/common_widget/shop_by_fabric_material_view.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/common_widget/unstiched_carousel_view.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.height, required this.width, required this.homeController});

  final double height;
  final double width;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Obx(
        () => homeController.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// First common box of fabrics
                      FirstCommonBox(homeController: homeController, height: height, width: width),

                      /// Suggestion
                      CarouselSliderView(height: height, width: width, homeController: homeController),

                      /// Shoe by category
                      commonTitle("Shop by category"),
                      ShopByCategoryView(height: height, width: width, homeController: homeController, whichCategory: 0),

                      /// Shop by fabrice material
                      commonTitle("Shop by fabrice material"),
                      ShopByFabricMaterialView(height: height, width: width, homeController: homeController), SizedBox(height: 10),

                      /// Unstiched
                      commonTitle("Unstitched"),
                      UnStitchedCarouselView(height: height, width: width, homeController: homeController),

                      ///Boutique collection
                      commonTitle("Boutique collection"),
                      UnStitchedCarouselView(
                        height: height,
                        width: width,
                        homeController: homeController,
                        isBoutiqueCollection: true,
                      ),

                      /// Range of pattern
                      commonTitle("Range of pattern"),

                      ShopByFabricMaterialView(height: height, width: width, homeController: homeController),

                      ///Design as per occasion
                      commonTitle("Design as per occasion"),
                      ShopByCategoryView(height: height, width: width, homeController: homeController, whichCategory: 1),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: Row(
        children: [
          Image.asset(UrlConstant.appLogo, height: height * 0.06),
        ],
      ),
      actions: const [
        Icon(Icons.search),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }

  Widget commonTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
