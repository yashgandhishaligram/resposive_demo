import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var searchIsOpen = false.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  var isFav = false.obs;

  var headerSectionList = [
    {
      "section": "Home",
      "isSelected": true,
    },
    {
      "section": "About",
      "isSelected": false,
    },
    {
      "section": "Contact Us",
      "isSelected": false,
    },
    {
      "section": "Blog",
      "isSelected": false,
    }
  ].obs;

  var categoryList = [
    {"image": "assets/icons/phones.png", "category": "Phones"},
    {"image": "assets/icons/smart_watches.png", "category": "Smart Watches"},
    {"image": "assets/icons/cameras.png", "category": "Cameras"},
    {"image": "assets/icons/headphones.png", "category": "HeadPhones"},
    {"image": "assets/icons/computers.png", "category": "Computers"},
    {"image": "assets/icons/gaming.png", "category": "Gaming"},
  ];

  var productList = [
    {
      "product_picture": "assets/images/products/iphone_14_pro.png",
      "product_name": "Apple iPhone 14 Pro Max 128GB Deep Purple (MQ9T3RX/A)",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/camera.png",
      "product_name": "Blackmagic Pocket Cinema Camera 6k",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch.png",
      "product_name": "Apple Watch Series 9 GPS 41mm Starlight Aluminium Case",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch.png",
      "product_name": "AirPods Max Silver",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch.png",
      "product_name": "Samsung Galaxy Watch6 Classic 47mm Black",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch.png",
      "product_name": "Galaxy Z Fold5 Unlocked | 256GB | Phantom Black",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch.png",
      "product_name": "Galaxy Buds FE Graphite",
      "product_price": "25.0"
    },
    {
      "product_picture": "assets/images/products/watch 2.png",
      "product_name": "Apple iPad 9 10.2' 64GB Wi-Fi Silver (MK2L3) 2021",
      "product_price": "25.0"
    },
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void onChangeSearch() {
    searchIsOpen.value = !searchIsOpen.value;
  }

  void onCategorySelection(Map e) {
    var selectedItem = headerSectionList.indexOf(e);
  }

  void moveForwardBackward() {
    scrollController.position.animateTo(5,
        duration: const Duration(milliseconds: 500), curve: Curves.bounceOut);
  }

  void onFavourite(int index) {
    isFav.value = !isFav.value;
  }
}
