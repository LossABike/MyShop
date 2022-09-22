import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget.product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$${widget.product.price}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              widget.product.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ]),
      ),
    );
  }
}
