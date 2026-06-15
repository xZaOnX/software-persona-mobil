// lib/data/products.dart

import '../models/product.dart';

/// Hard-coded list of products used as the catalog data source.
final List<Product> products = [
  const Product(
    id: 1,
    name: 'iPhone 15 Pro',
    price: 999.00,
    description:
        'The iPhone 15 Pro features a titanium design, A17 Pro chip, and a versatile Pro camera system.',
    imageAsset: 'assets/images/iphone15pro.jpeg',
  ),
  const Product(
    id: 2,
    name: 'MacBook Air M3',
    price: 1299.00,
    description:
        'Lightning-fast M3 chip, stunning Liquid Retina display, and up to 18 hours of battery life.',
    imageAsset: 'assets/images/macbookairm3.jpg',
  ),
  const Product(
    id: 3,
    name: 'Sony WH-1000XM5',
    price: 399.99,
    description:
        'Industry-leading noise cancellation, exceptional sound quality, and all-day comfort.',
    imageAsset: 'assets/images/sonywh1000xm5.jpeg',
  ),
  const Product(
    id: 4,
    name: 'iPad Air',
    price: 599.00,
    description:
        'Powerful M1 chip, 10.9-inch Liquid Retina display, and support for Apple Pencil.',
    imageAsset: 'assets/images/ipadair.png',
  ),
  const Product(
    id: 5,
    name: 'Galaxy Watch 6',
    price: 299.99,
    description:
        'Advanced health tracking, sleep coaching, and a sleek circular design.',
    imageAsset: 'assets/images/galaxywatch6.jpeg',
  ),
  const Product(
    id: 6,
    name: 'Pixel 8 Pro',
    price: 899.00,
    description:
        "Google's most advanced Pixel with AI-powered photo and video features.",
    imageAsset: 'assets/images/pixel8pro.jpeg',
  ),
  const Product(
    id: 7,
    name: 'Dell XPS 13',
    price: 1199.00,
    description:
        'Compact, premium laptop with InfinityEdge display and Intel Core processors.',
    imageAsset: 'assets/images/dellxps13.jpg',
  ),
  const Product(
    id: 8,
    name: 'AirPods Pro 2',
    price: 249.00,
    description:
        'Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio.',
    imageAsset: 'assets/images/airpodspro2.jpeg',
  ),
  const Product(
    id: 9,
    name: 'Surface Pro 9',
    price: 999.99,
    description:
        'Versatile 2-in-1 laptop with a high-resolution touchscreen and all-day battery.',
    imageAsset: 'assets/images/surfacepro9.jpeg',
  ),
  const Product(
    id: 10,
    name: 'Garmin Fenix 7',
    price: 549.99,
    description:
        'Rugged multisport GPS smartwatch with advanced training and mapping features.',
    imageAsset: 'assets/images/garminfenix7.jpeg',
  ),
  const Product(
    id: 11,
    name: 'OnePlus 12',
    price: 799.99,
    description:
        'Flagship performance, Hasselblad cameras, and ultra-fast charging.',
    imageAsset: 'assets/images/oneplus12.png',
  ),
  const Product(
    id: 12,
    name: 'Lenovo ThinkPad X1',
    price: 1399.00,
    description:
        'Legendary business laptop with a best-in-class keyboard and robust build quality.',
    imageAsset: 'assets/images/thinkpadx1.jpeg',
  ),
];
