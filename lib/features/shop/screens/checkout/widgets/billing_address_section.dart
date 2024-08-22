part of 'widget_imports.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Ngb4o', style: Theme.of(context).textTheme.bodyLarge),

        const SizedBox(height: TSizes.spaceBtwItems/2),


        // Phone
        Row(
          children: [
            const Icon(Icons.phone, color: TColors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('0962492787', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2),

        // Address
        Row(
          children: [
            const Icon(Icons.location_history, color: TColors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Flexible(
              child: Text(
                '71 Nguyen Dinh Hien, Da Nang',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    );
  }
}
