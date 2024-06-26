import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnStitchedCarouselView extends StatelessWidget {
  const UnStitchedCarouselView(
      {super.key, required this.height, required this.width, required this.homeController, this.isBoutiqueCollection = false});

  final double height;
  final double width;
  final bool isBoutiqueCollection;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: List.generate(
            5,
            (index) {
              return boutiqueBox(width: width, height: height);
            },
          ),
          carouselController: homeController.carouselController,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: isBoutiqueCollection ? 1.3 : 1.2,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: isBoutiqueCollection ? 0.8 : 1,
              onPageChanged: (index, reason) {
                // setState(() {
                if (!isBoutiqueCollection) {
                  homeController.currentCarousel.value = index;
                }
                // });
              }),
        ),

        /// Carosule slider indicator
        if (!isBoutiqueCollection)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              // children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => homeController.carouselController.animateToPage(index),
                child: Obx(
                  () => Container(
                    width: homeController.currentCarousel.value == index ? 9 : 6,
                    height: homeController.currentCarousel.value == index ? 9 : 6,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(homeController.currentCarousel.value == index ? 0.9 : 0.4)),
                  ),
                ),
              );
            }).toList(),
          )
      ],
    );
  }

  /// Botique collection
  Widget boutiqueBox({
    required double height,
    required double width,
  }) {
    return Container(
      height: height * 0.4,
      width: width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 0))],
        image: const DecorationImage(image: NetworkImage(UrlConstant.placeholderImageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(offset: const Offset(0, 0), color: Colors.black.withOpacity(0.5), spreadRadius: 2, blurRadius: 2)],
          // color: Colors.black.withOpacity(0.3),
        ),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fabric" * 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              "Explore",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
