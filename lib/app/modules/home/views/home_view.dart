import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resposive_demo/app/const/constant.dart';

import '../../../utils/responsive.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
          key: controller.scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          endDrawer: appDrawer(),
          appBar: AppBar(
            leading: const SizedBox(),
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            actions: [
              if (Responsive.isMobile(context))
                InkWell(
                    onTap: () {
                      controller.scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: imageWidget(
                          image: "assets/images/three_line.png",
                          height: 40,
                          width: 40),
                    ))
              else
                const SizedBox()
            ],
            backgroundColor: Colors.white,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageWidget(
                      image: "assets/images/app_logo.png",
                      height: 22,
                      width: 65),
                  if (!Responsive.isMobile(context))
                    Flexible(
                      flex: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              height: 50,
                              width: size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: CustomTextFieldWidget(
                                  validator: '',
                                  borderRadius: 20.0,
                                  isPrefix: true,
                                  preIcon: Icons.search,
                                  fillColor: Colors.grey.withOpacity(0.1),
                                  textEditingController:
                                  controller.searchController,
                                  labelText: 'Search'),
                            ),
                          ),
                          ...controller.headerSectionList
                              .map((Map e) =>
                              InkWell(
                                onTap: () =>
                                    controller.onCategorySelection(e),
                                child: textWidget(
                                    text: e["section"].toString(),
                                    isSelected: e["isSelected"]),
                              )),
                          const SizedBox(width: 10),
                          iconWidget(
                              icon: Icons.favorite_border_outlined,
                              color: Colors.black),
                          iconWidget(
                              icon: Icons.shopping_cart_outlined,
                              color: Colors.black),
                          iconWidget(
                              icon: Icons.person_2_outlined,
                              color: Colors.black),
                        ],
                      ),
                    ),
                ]),
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse
              }),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Responsive.isMobile(context))
                    imageWidget(
                        image: "assets/images/iphone_banner_mobile.png",
                        width: size.width,
                        blendMode: BlendMode.colorDodge,
                        fit: BoxFit.fitWidth),
                  if (!Responsive.isMobile(context))
                    imageWidget(
                        image: "assets/images/iphone_banner_web.png",
                        width: size.width,
                        blendMode: BlendMode.colorDodge,
                        fit: BoxFit.fitWidth),
                  if (!Responsive.isMobile(context))
                    imageWidget(
                        image: "assets/images/laptop_banner_web.png",
                        width: size.width,
                        blendMode: BlendMode.colorDodge,
                        fit: BoxFit.fitWidth),
                  if (Responsive.isMobile(context))
                    ...List.generate(
                        4,
                            (index) =>
                            imageWidget(
                                image:
                                "assets/images/mobile_banner_${index + 1}.png",
                                width: size.width,
                                blendMode: BlendMode.colorDodge,
                                fit: BoxFit.fitWidth)),
                  browseCategorySection(context),
                  tabBarView(context),
                  webBannerView(context),
                  discountSection(context),
                  const SizedBox(height: 20),
                  showFooterBanner(context),
                  footerView(context),
                ],
              ),
            ),
          )),
    );
  }

  Widget appDrawer() {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: iconWidget(
                      icon: Icons.close,
                      color: Colors.white,
                      onTap: () {
                        controller.scaffoldKey.currentState?.closeEndDrawer();
                      })),
              const SizedBox(height: 40),
              ...controller.headerSectionList.map((Map e) =>
                  drawerTextWidget(
                      text: e["section"].toString(),
                      isSelected: e["isSelected"])),
            ]),
      ),
    );
  }

  Widget categorySection({IconData? icon, String? name}) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf_rounded, color: Colors.white),
          Text(
            "data",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget browseCategorySection(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.symmetric(horizontal: size.width * 0.11, vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Browse By Category",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left, size: 25)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right, size: 25))
            ],
          ),
          SizedBox(
            height: Responsive.isMobile(context) ? 700 : 200,
            width: size.width,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse
              }),
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 15.0,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 1),
                  controller: controller.scrollController,
                  itemCount: controller.categoryList.length,
                  physics: Responsive.isMobile(context)
                      ? const NeverScrollableScrollPhysics()
                      : Responsive.isTablet(context)
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Responsive.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  itemBuilder: (context, index) {
                    var category = controller.categoryList[index];
                    return categoryWidget(
                        image: category["image"].toString(),
                        category: category["category"].toString());
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryWidget({required String image, required String category}) {
    return Container(
      height: 128,
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: categoryBgColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageWidget(image: image, fit: BoxFit.fitWidth),
          Flexible(
              child: Text(category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16))),
        ],
      ),
    );
  }

  Widget profileItem({IconData? icon, String? name}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 25),
          SizedBox(width: 10),
          Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget textWidget({required String text, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget drawerTextWidget({required String text, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.withOpacity(0.8),
            fontSize: 27,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget iconWidget(
      {required IconData icon, VoidCallback? onTap, Color? color}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: IconButton(icon: Icon(icon, color: color), onPressed: onTap));
  }

  Widget imageWidget({String? image,
    double? height,
    double? width,
    BlendMode? blendMode,
    BoxFit? fit}) {
    return Image.asset(
      image!,
      color: Colors.transparent,
      height: height,
      width: width,
      colorBlendMode: blendMode,
      fit: fit,
    );
  }

  Widget tabBarView(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.symmetric(horizontal: size.width * 0.11, vertical: 0)
          : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          TabBar(
              controller: controller.tabController,
              padding: Responsive.isDesktop(context)
                  ? EdgeInsets.only(right: size.width / 2)
                  : EdgeInsets.zero,
              labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.grey.withOpacity(0.8),
              indicatorColor: Colors.black,
              tabs: const [
                Tab(
                  text: "New Arrival",
                ),
                Tab(
                  text: "Best Seller",
                ),
                Tab(
                  text: "Featured Products",
                )
              ]),
          SizedBox(
            height: size.height,
            child: TabBarView(controller: controller.tabController, children: [
              newArrivals(context),
              newArrivals(context),
              newArrivals(context),
            ]),
          ),
        ],
      ),
    );
  }

  Widget newArrivals(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 25.0,
            mainAxisExtent: 380,
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4),
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return productWidget(
              image: "assets/images/products/Iphone_14_pro.png",
              productName:
              "Apple iPhone 14 Pro Max 128GB Deep Purple (MQ9T3RX/A)",
              price: "5.00",
              context: context,
              index: index);
        });
  }

  Widget discountSection(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.symmetric(horizontal: size.width * 0.11, vertical: 0)
          : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Discounts up to -50%",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            // padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                  mainAxisExtent: 380,
                  crossAxisCount: Responsive.isMobile(context) ? 2 : 4),
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return productWidget(
                    image: "assets/images/products/Iphone_14_pro.png",
                    productName:
                    "Apple iPhone 14 Pro Max 128GB Deep Purple (MQ9T3RX/A)",
                    price: "5.00",
                    context: context,
                    index: index);
              }),
        ],
      ),
    );
  }

  Widget productWidget({String? image,
    String? productName,
    String? price,
    context,
    required int index}) {
    var size = MediaQuery
        .of(context)
        .size;
    return Obx(
          () =>
          Container(
            height: 432,
            width: 268,
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: cardBgColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          controller.onFavourite(index);
                        },
                        icon: Icon(
                          controller.isFav.value
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: controller.isFav.value
                              ? Colors.red
                              : iconColor,
                          size: 25,
                        ))),
                imageWidget(
                  image: image,
                  height: 160,
                  width: 160,
                  blendMode: BlendMode.color,
                ),
                //const SizedBox(height: 5),
                Text(
                  productName ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                // const SizedBox(height: 5),
                Text(
                  "\$ $price",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                buyNowBtn()
              ],
            ),
          ),
    );
  }

  Widget buyNowBtn() {
    return SizedBox(
      height: 48,
      width: 183,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.black),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)))),
          child: const Text(
            "Buy Now",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
          )),
    );
  }

  Widget webBannerView(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      height: 640,
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              // mainAxisExtent: Responsive.isDesktop(context) ? 200 : ,
              crossAxisCount: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageWidget(
                image: "assets/images/big_banner_${index + 1}.png",
                height: size.height,
                // width: size.width,
                blendMode: BlendMode.colorDodge,
                fit: BoxFit.contain);
          }),
    );
  }

  Widget showFooterBanner(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Responsive.isMobile(context)
        ? imageWidget(
        image: "assets/images/footer_banner_mobile.png",
        width: size.width,
        blendMode: BlendMode.colorDodge,
        fit: BoxFit.fitWidth)
        : imageWidget(
        image: "assets/images/footer_banner_web.png",
        width: size.width,
        blendMode: BlendMode.colorDodge,
        fit: BoxFit.fitWidth);
  }

  Widget footerView(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
        width: double.maxFinite,
        height: !Responsive.isMobile(context) ? 504 : size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Colors.black,
        child: Responsive.isMobile(context)
            ? mobileFooter()
            : webFooter());
  }

  Widget mobileFooter(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        const Text(
          "cyber",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28),
        ),
        const SizedBox(height: 10),
        const Text(
          "We are a residential interior design firm located in\nPortland. Our boutique-studio offers more than",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
        const SizedBox(height: 20),
        footerTitleWidget("Services"),
        textButtonWidget(text: "Bonus program", onTap: () {}),
        textButtonWidget(text: "Gift cards", onTap: () {}),
        textButtonWidget(text: "Credit and payment", onTap: () {}),
        textButtonWidget(text: "Service contracts", onTap: () {}),
        textButtonWidget(text: "Non-cash account", onTap: () {}),
        textButtonWidget(text: "Payment", onTap: () {}),
        footerTitleWidget("Assistance to the buyer"),
        textButtonWidget(text: "Find an order", onTap: () {}),
        textButtonWidget(text: "Terms of delivery", onTap: () {}),
        textButtonWidget(
            text: "Exchange and return of goods", onTap: () {}),
        textButtonWidget(text: "Guarantee", onTap: () {}),
        textButtonWidget(text: "Frequently asked questions", onTap: () {}),
        textButtonWidget(text: "Terms of use of the site", onTap: () {}),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget(image: "assets/icons/Twitter.png",
                height: 28,
                width: 28),
            const SizedBox(width: 30),
            imageWidget(image: "assets/icons/Facebook.png",
                height: 24,
                width: 24),
            const SizedBox(width: 30),
            imageWidget(image: "assets/icons/Tiktok.png",
                height: 28,
                width: 28),
            const SizedBox(width: 30),
            imageWidget(image: "assets/icons/Instagram.png",
                height: 28,
                width: 28)
          ],
        )
      ],
    );
  }

  Widget webFooter(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "cyber",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We are a residential interior design firm located in Portland. Our\nboutique-studio offers more than",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                const Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageWidget(image: "assets/icons/Twitter.png",
                          height: 28,
                          width: 28),
                      const SizedBox(width: 30),
                      imageWidget(image: "assets/icons/Facebook.png",
                          height: 24,
                          width: 24),
                      const SizedBox(width: 30),
                      imageWidget(image: "assets/icons/Tiktok.png",
                          height: 28,
                          width: 28),
                      const SizedBox(width: 30),
                      imageWidget(image: "assets/icons/Instagram.png",
                          height: 28,
                          width: 28)
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              footerTitleWidget("Services"),
              textButtonWidget(text: "Bonus program", onTap: () {}),
              textButtonWidget(text: "Gift cards", onTap: () {}),
              textButtonWidget(text: "Credit and payment", onTap: () {}),
              textButtonWidget(text: "Service contracts", onTap: () {}),
              textButtonWidget(text: "Non-cash account", onTap: () {}),
              textButtonWidget(text: "Payment", onTap: () {}),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              footerTitleWidget("Assistance to the buyer"),
              textButtonWidget(text: "Find an order", onTap: () {}),
              textButtonWidget(text: "Terms of delivery", onTap: () {}),
              textButtonWidget(text: "Exchange and return of goods", onTap: () {}),
              textButtonWidget(text: "Guarantee", onTap: () {}),
              textButtonWidget(text: "Frequently asked questions", onTap: () {}),
              textButtonWidget(text: "Terms of use of the site", onTap: () {}),
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
  Widget footerTitleWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        // textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  Widget textButtonWidget({String? text, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.zero
          )
        ),
          onPressed: onTap,
          child: Text(
            text ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          )),
    );
  }

}
