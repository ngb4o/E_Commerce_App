part of 'widget_imports.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being loaded
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: TColors.white,
        )
      ],
    );
  }
}
