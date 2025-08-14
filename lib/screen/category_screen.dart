import 'package:flutter/material.dart';
import 'package:free_course/model/brand_list.dart';

import '../api_service/api_service.dart';
import '../model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});




  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _futureCategories;
  late Future<List<BrandList>> _futureBrandList;

  @override
  void initState() {
    super.initState();
    _futureCategories = ApiService().fetchCategories();
    _futureBrandList = ApiService().fetchBrandList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categoriess')),
      body: Column(
        children: [
          SizedBox(

            height: 200,
            child: FutureBuilder<List<Category>>(
              future: _futureCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final categories = snapshot.data;

                if (categories == null || categories.isEmpty) {
                  return const Center(child: Text('No categories found.'));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Image.network(
                            categories[index].categoryImg,
                            width: 100,
                            height: 100,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image),
                          ),
                          SizedBox(height: 5),
                          Text(categories[index].categoryName),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<BrandList>>(
              future: _futureBrandList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No brands available"));
                }

                final brands = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1, // Square cards
                        ),
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  brand.brandImg.toString(),
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 50),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              brand.brandName.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
