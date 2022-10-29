import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../cart/cart_manager.dart';
import 'product_detail_screen.dart';


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
      leading: ValueListenableBuilder<bool>(
        valueListenable: widget.product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              widget.product.isFavorite = !isFavorite;
            },
          );
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
          final cart = context.read<CartManager>();
          cart.addItem(widget.product);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text(
                  'Item added to cart',
                ),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    cart.removeSingleItem(widget.product.id!);
                  },
                ),
              ),
            );
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
