import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final List<Product> items = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier (${cart.itemCount})'),
      ),
      body: items.isEmpty
          ? Center(child: Text('Votre panier est vide.'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return ListTile(
                  leading: Image.network(product.images?.first ?? ''),
                  title: Text(product.title ?? ''),
                  subtitle: Text('${product.price} €'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total : ${items.fold(0.0, (sum, item) => sum + (item.price?.toDouble() ?? 0.0)).toStringAsFixed(2)} €',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // TODO : Implémenter la validation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Commande validée !')),
                    );
                    cart.clearCart();
                  },
                  child: Text('Valider la commande'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
