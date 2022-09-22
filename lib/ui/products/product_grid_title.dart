import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';
import '../shared/app_drawer.dart';

class ProductGridTile extends StatefulWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  State<ProductGridTile> createState() => _ProductGridTileState();
}

class _ProductGridTileState extends State<ProductGridTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: widget.product.id,
            );
          },
          child: Image.network(
            widget.product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
          widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('Toggle a favorite product');
        },
      ),
      title: Text(
        widget.product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          print('Add item to cart');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
