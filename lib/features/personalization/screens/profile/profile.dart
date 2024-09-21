part of 'profile_imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    // Delete account warning
    void deleteAccountWarningPopup() {
      Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account permanently ? '
            'This action is not reversible and all of your data will be removed permanently',
        confirm: ElevatedButton(
          onPressed: () => controller.deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete')),
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ),
      );
    }

    return Scaffold(
      appBar: const TAppbar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Profile Infor
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onTap: () => Get.to(() => const UpdateNameScreen())),
              TProfileMenu(title: 'Username', value: controller.user.value.username, onTap: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Infor
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User ID', value: controller.user.value.id, onTap: () {}, icon: Iconsax.copy),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onTap: () {}),
              TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onTap: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
              TProfileMenu(title: 'Date of Birth', value: '8 May, 2003', onTap: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: deleteAccountWarningPopup,
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
