part of 'widget_imports.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) {
        return Column(
          children: [
            // Cart Item
            const TCartItem(),
            if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

            // Add Remove Button Row with total Price
            if(showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      // Add Remove Buttons
                      TProductQuantityWithAddRemove(),
                    ],
                  ),

                  // Product total price
                  TProductPriceText(price: '256')
                ],
              )
          ],
        );
      },
    );
  }
}
