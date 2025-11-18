import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final int index;

  const CategoryWidget({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isEven = index.isEven;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            isDarkMode ? (category.lightImage ?? '') : (category.darkImage ?? ''),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            top: 20,
            left: isEven ? null : 20,
            right: isEven ? 20 : null,
            child: Text(
              category.title ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: isEven ? null : 16,
            right: isEven ? 16 : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white : Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: isDarkMode ? Colors.black : Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}