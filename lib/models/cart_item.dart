// lib/models/cart_item.dart

import 'product.dart';

/// Represents a single product line item in the shopping cart.
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  /// Total price for this line item.
  double get totalPrice => product.price * quantity;
}
