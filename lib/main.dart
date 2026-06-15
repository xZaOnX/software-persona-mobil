// lib/main.dart

import 'package:flutter/material.dart';
import 'models/cart_item.dart';
import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
///
/// Holds the shopping cart state and exposes callbacks for child screens.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CartItem> _cartItems = [];

  int get itemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  void _addToCart(Product product) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index >= 0) {
        _cartItems[index].quantity++;
      } else {
        _cartItems.add(CartItem(product: product));
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      _cartItems.removeWhere((item) => item.product.id == product.id);
    });
  }

  void _incrementQuantity(Product product) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index >= 0) {
        _cartItems[index].quantity++;
      }
    });
  }

  void _decrementQuantity(Product product) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index >= 0) {
        if (_cartItems[index].quantity > 1) {
          _cartItems[index].quantity--;
        } else {
          _cartItems.removeAt(index);
        }
      }
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
    });
  }

  void _navigateToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          cartItems: _cartItems,
          itemCount: itemCount,
          totalPrice: totalPrice,
          onRemoveFromCart: _removeFromCart,
          onIncrementQuantity: _incrementQuantity,
          onDecrementQuantity: _decrementQuantity,
          onClearCart: _clearCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: HomeScreen(
        itemCount: itemCount,
        onAddToCart: _addToCart,
        onNavigateToCart: _navigateToCart,
      ),
    );
  }
}
