part of 'store_imports.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppbar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          // Header
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // Brands GRID
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 75,
                        itemBuilder: (_, index) {
                          return const TBrandCard();
                        },
                      ),
                    ],
                  ),
                ),
                // Tab
                bottom: const TTabBar(
                  tabs: [
                    Tab(text: 'Sports'),
                    Tab(text: 'Furniture'),
                    Tab(text: 'Electronics'),
                    Tab(text: 'Clothes'),
                    Tab(text: 'Cosmetics'),
                  ],
                ),
              ),
            ];
          },

          // Body
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
