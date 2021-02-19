import 'package:flutter/material.dart';

class CartItemsWidget extends StatelessWidget {
  final String id;
  final String itemName;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItemsWidget(
    this.id,
    this.itemName,
    this.quantity,
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GridTile(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.39,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 5, left: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      itemName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      price.toString(),
                    ),
                    // Row(
                    //   children: [
                    //     IconButton(
                    //       icon: Icon(product.isFavourite
                    //           ? Icons.favorite
                    //           : Icons.favorite_border_outlined),
                    //       color: Colors.red,
                    //       onPressed: () =>
                    //           product.addProductToFavourite(product),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
