import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:product_test/domain/entity/product.dart';

class ProductWidget extends StatelessWidget {
  final Product _product;
  const ProductWidget(
    this._product, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _product.name,
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        '\$${_product.price}',
                        style: GoogleFonts.raleway(
                          color: Colors.blue[400],
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
