import 'package:carousel_slider/carousel_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/service/service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  RxList<SliderModel?> sliderDataList = <SliderModel>[].obs;
  RxList<CategoryModel?> categoryDataList = <CategoryModel>[].obs;
  RxList<ShopByCategoryModel?> shopByCategoryDataList = <ShopByCategoryModel>[].obs;
  RxList<ProductModel?> productDataList = <ProductModel>[].obs;
  CarouselController carouselController = CarouselController();
  RxInt currentCarousel = 0.obs;
  RxInt currentTab = 0.obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllData();
    super.onInit();
  }

  getAllData() async {
    isDataLoading.value = true;
    sliderDataList.value = await ApiService.getCategory() ?? <SliderModel>[];
    categoryDataList.value = await ApiService.getCategory1() ?? <CategoryModel>[];
    shopByCategoryDataList.value = await ApiService.getCategory2() ?? <ShopByCategoryModel>[];
    productDataList.value = await ApiService.getCategory3() ?? <ProductModel>[];
    print(
        "getAllData sliderDataList ${sliderDataList.length} categoryDataList ${categoryDataList.length} shopByCategoryDataList ${shopByCategoryDataList.length} productDataList ${productDataList.length}");
    isDataLoading.value = false;
  }
}
