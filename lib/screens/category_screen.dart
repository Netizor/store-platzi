import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/services/category_api_service.dart';
import 'package:store/screens/product_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Category category = context.watch<CategoryProvider>().category!;

    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            category.name!,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          FutureBuilder(
            future: CategoryApiService().getProductsByCategoryId(category.id!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> data = snapshot.requireData;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final product = data[index];

                    return ListTile(
                      leading: Image.network(product.images![0]),
                      title: Text(product.title!),
                      subtitle: Text('${product.price!}€'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
