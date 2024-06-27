import 'package:carousel_slider/carousel_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/model/home_tab_model.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/service/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentTab = 0.obs;
  RxInt currentCarousel = 0.obs;
  RxBool isDataLoading = false.obs;
  CarouselController carouselController = CarouselController();

  // All list of categories
  RxList<SliderModel?> sliderDataList = <SliderModel>[].obs;
  RxList<CategoryModel?> categoryDataList = <CategoryModel>[].obs;
  RxList<ProductModel?> productDataList = <ProductModel>[].obs;
  RxList<ShopByCategoryModel?> shopByCategoryDataList = <ShopByCategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllData();
    super.onInit();
  }

  getAllData() async {
    try {
      isDataLoading.value = true;
      sliderDataList.value = await ApiService.getSliderListData() ?? <SliderModel>[];
      categoryDataList.value = await ApiService.getCategoryData() ?? <CategoryModel>[];
      shopByCategoryDataList.value = await ApiService.getShopByCategoryModelData() ?? <ShopByCategoryModel>[];
      productDataList.value = await ApiService.getRangeOfPattenData() ?? <ProductModel>[];
      print(
          "getAllData sliderDataList ${sliderDataList.length} categoryDataList ${categoryDataList.length} shopByCategoryDataList ${shopByCategoryDataList.length} productDataList ${productDataList.length}");
      isDataLoading.value = false;
    } on Exception catch (e, st) {
      print("Error in getAllData $e $st");
    }
  }
}
