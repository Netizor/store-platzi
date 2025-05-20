import 'package:flutter/material.dart';
import 'package:store/widgets/home/ad_widget.dart';
import 'package:store/widgets/home/categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre
          Text(
            'Bienvenue sur My Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const AdWidget(),
          const SizedBox(height: 24),

          const CategoriesWidget(),
        ],
      ),
    );
  }
}
