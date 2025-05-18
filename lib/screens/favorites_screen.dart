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
          icon: Icon(Icons.home),
          onPressed: () {
            context.goNamed('home');
          },
          tooltip: "Retour à l'accueil",
        ),
      ),
      body: favorites.isEmpty
          ? Center(child: Text("Vous n'avez pas encore ajouté de favoris."))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final product = favorites[index];
          return ListTile(
            leading: Image.network(product.images?.first ?? ''),
            title: Text(product.title ?? ''),
            subtitle: Text('${product.price?.toStringAsFixed(2)} €'),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                favoritesProvider.toggleFavorite(product);
              },
            ),
          );
        },
      ),
    );
  }
}
