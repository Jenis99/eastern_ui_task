import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key, required this.height, required this.width, required this.homeController});

  final double height;
  final double width;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.4,
        enlargeCenterPage: true,
      ),
      items: List.generate(
        homeController.sliderDataList.first?.sliderImages?.length ?? 0,
        (index) {
          return secondCommonBoxUI(height, width, homeController.sliderDataList.first?.sliderImages?[index] ?? SliderImages());
        },
      ),
    );
  }

  Widget secondCommonBoxUI(double height, double width, SliderImages sliderData) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        secondCommonBox(width: width, height: height, image: sliderData.image ?? UrlConstant.placeholderImageUrl),
        Container(
          width: width * 0.55,
          height: height * 0.15,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
              ),
            ],
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sliderData.title ?? "NOT ALL FASHION COMES AT HEAVY PRICE", style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              Text(sliderData.title ?? "NOT ALL FASHION COMES AT HEAVY PRICE", style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              Text("Explore ${sliderData.sortOrder ?? ""}", style: const TextStyle(fontSize: 8)),
            ],
          ),
        )
      ],
    );
  }

  Widget secondCommonBox({required double height, required double width, required String image}) {
    return Container(
      height: height * 0.8,
      width: width * 0.85,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: const Color(0xffffe3c6),
        height: height * 0.08,
      ),
    );
  }
}
