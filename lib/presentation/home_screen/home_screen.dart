import 'package:flutter/material.dart';
import 'package:newss_app/presentation/common/widgets/custom_scaffold.dart';
import 'package:newss_app/presentation/home_screen/widgets/category_card.dart';
import '/data/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      actions: [Icon(Icons.search)],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Good Morning\nHere is Some News For You',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                var category = CategoryModel.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CategoryCard(category: category, index: index),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
