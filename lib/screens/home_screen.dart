// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

/// Displays the product grid and provides navigation to product details and cart.
class HomeScreen extends StatelessWidget {
  final int itemCount;
  final void Function(Product) onAddToCart;
  final void Function(BuildContext) onNavigateToCart;

  const HomeScreen({
    super.key,
    required this.itemCount,
    required this.onAddToCart,
    required this.onNavigateToCart,
  });

  void _navigateToDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
          onAddToCart: () => onAddToCart(product),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onTap: () => _navigateToDetail(context, product),
                );
              },
            ),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: _FloatingCartButton(
              itemCount: itemCount,
              onPressed: () => onNavigateToCart(context),
            ),
          ),
        ],
      ),
    );
  }
}

/// A small circular floating cart button with a quantity badge.
class _FloatingCartButton extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  const _FloatingCartButton({
    required this.itemCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 6,
      shape: const CircleBorder(),
      color: theme.colorScheme.primary,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 28,
                color: theme.colorScheme.onPrimary,
              ),
              if (itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      itemCount > 99 ? '99+' : '$itemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
