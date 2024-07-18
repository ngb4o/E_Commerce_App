import 'package:ee_commerce_app/features/shop/screens/home/home_imports.dart';
import 'package:ee_commerce_app/features/shop/screens/profile/profile_imports.dart';
import 'package:ee_commerce_app/features/shop/screens/store/store_imports.dart';
import 'package:ee_commerce_app/features/shop/screens/wishlist/wishlist_imports.dart';
import 'package:ee_commerce_app/utils/constants/colors.dart';
import 'package:ee_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            },

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
}
