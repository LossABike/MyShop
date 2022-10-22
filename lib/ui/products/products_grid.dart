import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'product_grid_title.dart';
import 'products_manager.dart';

class ProductsGrid extends StatefulWidget {
  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {


  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => widget.showFavorites
            ? productsManager.favoriteItems
            : productsManager.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
