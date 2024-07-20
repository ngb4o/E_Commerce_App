part of 'widget_imports.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock Status
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price : ', smallSize: true),
                          Row(
                            children: [
                              // Actual Price
                              Text(
                                '\$25',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              // Sale Price
                              const TProductPriceText(price: '20')
                            ],
                          )
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock : ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Variation Description
              const TProductTitleText(
                title: 'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLine: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Sizes'),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
