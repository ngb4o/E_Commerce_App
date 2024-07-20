part of 'settings_imports.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TAppbar(
                    title: Text(
                      'Account',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),

                  // User profile Card
                  TUserProfileTile(onPressed: () => Get.to(()=> const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Setting
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TSettingsMenuTile(
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home,
                  ),
                  const TSettingsMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                  ),
                  const TSettingsMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    icon: Iconsax.bag_tick,
                  ),
                  const TSettingsMenuTile(
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    icon: Iconsax.bank,
                  ),
                  const TSettingsMenuTile(
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    icon: Iconsax.discount_shape,
                  ),
                  const TSettingsMenuTile(
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    icon: Iconsax.notification,
                  ),
                  const TSettingsMenuTile(
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    icon: Iconsax.security_card,
                  ),

                  // App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    title: 'Load Data',
                    subtitle: 'Upload Data to your Cloud Firebase',
                    icon: Iconsax.document_upload,
                  ),
                  TSettingsMenuTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                    icon: Iconsax.location,
                  ),
                  TSettingsMenuTile(
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    icon: Iconsax.security_user,
                  ),
                  TSettingsMenuTile(
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    icon: Iconsax.image,
                  ),

                  // Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {}, child: const Text('Logout')),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
