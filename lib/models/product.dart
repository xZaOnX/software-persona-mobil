// lib/models/product.dart

/// Represents a product in the catalog.
class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}
