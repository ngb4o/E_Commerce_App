part of 'update_imports.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: const TAppbar(title: Text('Update Name'), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    validator: (value) => TValidator.validateEmptyText('First Name', value),
                    decoration:
                        const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    validator: (value) => TValidator.validateEmptyText('Last Name', value),
                    decoration:
                        const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Save button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save'),
                ))
          ],
        ),
      ),
    );
  }
}
