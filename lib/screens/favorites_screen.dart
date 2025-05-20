import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/favorites_provider.dart';
import 'package:store/models/product.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final List<Product> favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoris (${favorites.length})'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.goNamed('home');
          },
          tooltip: "Retour à l'accueil",
        ),
      ),
      body: favorites.isEmpty
          ? Center(
        child: Text(
          "Vous n'avez pas encore ajouté de favoris.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final product = favorites[index];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.images?.first ?? '',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image, size: 40),
                ),
              ),
              title: Text(
                product.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${product.price?.toStringAsFixed(2)} €',
                style: TextStyle(color: Colors.green.shade700),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesProvider.toggleFavorite(product);
                },
                tooltip: 'Retirer des favoris',
              ),
              onTap: () {
                // Navigation vers détail possible ici
              },
            ),
          );
        },
      ),
    );
  }
}
