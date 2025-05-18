import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/favorites_provider.dart';

import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final favorites = context.watch<FavoritesProvider>();

    bool isFav = favorites.isFavorite(product);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? 'Détail produit'),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              favorites.toggleFavorite(product);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.images?.first ?? '',
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '${product.price?.toStringAsFixed(2)} €',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(product.description ?? '', style: TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<CartProvider>().addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.title} ajouté au panier'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(Icons.add_shopping_cart),
                label: Text('Ajouter au panier'),
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
