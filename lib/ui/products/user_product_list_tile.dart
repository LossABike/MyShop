import 'package:flutter/material.dart';

import '../../models/product.dart';

class UserProductListTile extends StatefulWidget {
  final Product product;

  const UserProductListTile(
    this.product, {
    super.key,
  });

  @override
  State<UserProductListTile> createState() => _UserProductListTileState();
}

class _UserProductListTileState extends State<UserProductListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        print('GO to edit product screen');
      },
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        print('delete a product');
      },
      color: Theme.of(context).errorColor,
    );
  }
}
