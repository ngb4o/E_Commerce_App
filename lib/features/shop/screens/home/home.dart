part of 'home_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Searchbar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                  THomeCategories()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

