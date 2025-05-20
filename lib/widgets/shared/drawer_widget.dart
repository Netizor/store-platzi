import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Header du drawer avec logo ou avatar + nom
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.storefront, size: 40, color: Theme.of(context).primaryColor),
              ),
              accountName: Text('My Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),

            // Liste des options de menu
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Accueil'),
                    onTap: () {
                      Navigator.pop(context);  // ferme le drawer
                      context.goNamed('home'); // redirige vers home
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text('Catégories'),
                    onTap: () {
                      Navigator.pop(context);
                      context.goNamed('categories');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favoris'),
                    onTap: () {
                      Navigator.pop(context);
                      context.goNamed('favorites');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Panier'),
                    onTap: () {
                      Navigator.pop(context);
                      context.goNamed('cart');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Se connecter'),
                    onTap: () {
                      Navigator.pop(context);
                      context.goNamed('login');
                    },
                  ),
                ],
              ),
            ),

            // Footer optionnel
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '© 2025 My Store',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
