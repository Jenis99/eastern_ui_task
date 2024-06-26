import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';

class FirstCommonBox extends StatelessWidget {
  const FirstCommonBox({super.key, required this.homeController, required this.height, required this.width});
  final HomeController homeController;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: SizedBox(
          height: height * 0.15,
          child: ListView.builder(
            itemCount: homeController.sliderDataList[2]?.sliderImages?.length ?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final SliderImages sliderImages = homeController.sliderDataList[2]?.sliderImages?[index] ?? SliderImages();
              return firstCommonBox(height: height, width: width, sliderImages: sliderImages);
            },
            // 5,
            // (index) {
            // },
            // growable: true
          ),
        ),
      ),
    );
  }
  Widget firstCommonBox({required double height, required double width, required SliderImages sliderImages}) {
    return Container(
      // height: 100,
      height: height * 0.15,
      width: width * 0.45,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 0))],
        image: DecorationImage(image: NetworkImage(sliderImages.image ?? UrlConstant.placeholderImageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        color: Colors.white,
        width: width * 0.45,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Text(
          sliderImages.title ?? "Fabric" * 2,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }

}
