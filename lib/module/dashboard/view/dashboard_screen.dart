import 'package:eastern_ecommerce_app/module/dashboard/tabs/catergory_tab/view/category_sceeen.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/controller/home_controller.dart';
import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/view/home_screen.dart';
import 'package:eastern_ecommerce_app/utils/constant_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: Obx(
          () => homeController.currentTab.value == 0 // Home screen tab
              ? HomeScreen(height: height, width: width, homeController: homeController)
              : homeController.currentTab.value == 1 // Category screen tab
                  ? CategoryScreen(height: height, width: width, homeController: homeController) //category tab
                  : homeController.currentTab.value == 2 // Curate screen tab
                      ? const Center(child: Text("Curate tab"))
                      : homeController.currentTab.value == 3 // Sale screen tab
                          ? const Center(child: Text("Sale tab"))
                          : const Center(child: Text("More tab")), // More screen tab
        ) // more tab
        );
  }

  Widget bottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        currentIndex: homeController.currentTab.value,
        selectedItemColor: Colors.lightGreen,
        onTap: (index) {
          homeController.currentTab.value = index;
        },
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.factory_outlined),
            label: 'Curate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.high_quality),
            label: 'Sale',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'More',
          ),
        ],
      ),
    );
  }

  curretTabView() {
    switch (homeController.currentTab.value) {
      case 0:
        // do something
        break;
      case 1:
        // do something else
        break;
      case 2:
        return const TextStyle();
        break;
      case 3:
        break;
    }
  }
}
