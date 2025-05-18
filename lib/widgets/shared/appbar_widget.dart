import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  Widget _getLeftButton(BuildContext context) {
    return context.canPop()
        ? IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        )
        : IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _getLeftButton(context),
      title: GestureDetector(
        onTap: () {
          context.goNamed('home');
        },
        child: Text('My Store'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.goNamed('cart');
          },
          icon: Icon(Icons.shopping_cart),
        ),
        IconButton(
            onPressed: () {
              context.goNamed('favorites');
            },
            icon: Icon(Icons.favorite)
        ),
        IconButton(
          onPressed: () {
            context.goNamed('login');
          },
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
