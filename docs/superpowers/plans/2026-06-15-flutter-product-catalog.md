# Flutter Product Catalog Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a clean, beautiful Flutter product catalog app using only built-in Flutter/Dart tools, with multi-file organization, hard-coded product data, grid/list navigation, and simple `setState` cart simulation.

**Architecture:** A single-page Material app where `HomeScreen` owns `cartCount`, displays a `GridView` of `ProductCard` widgets, and pushes `ProductDetailScreen` via `Navigator.push`. State is lifted to `HomeScreen` and propagated through callbacks.

**Tech Stack:** Flutter SDK, Dart (null safety), Material Design 3.

---

## File Structure

```
lib/
├── main.dart
├── models/
│   └── product.dart
├── data/
│   └── products.dart
├── screens/
│   ├── home_screen.dart
│   └── product_detail_screen.dart
└── widgets/
    └── product_card.dart
```

---

### Task 1: Scaffold the Flutter Project

**Files:**
- Create: entire project tree via `flutter create`
- Modify: `.gitignore` (if needed)

- [ ] **Step 1: Create the Flutter project with the correct name, organization, and platforms**

Run:
```bash
flutter create \
  --project-name software_persona_mobil \
  --org com.softwarepersona \
  --platforms android,ios \
  .
```

Expected: `flutter create` succeeds and populates the directory with `lib/`, `android/`, `ios/`, `pubspec.yaml`, etc.

- [ ] **Step 2: Verify the project was created**

Run:
```bash
ls -la && cat pubspec.yaml | head -30
```

Expected: `pubspec.yaml` contains `name: software_persona_mobil`.

- [ ] **Step 3: Commit**

```bash
git add .
git commit -m "chore: scaffold flutter project software_persona_mobil"
```

---

### Task 2: Define the Product Model

**Files:**
- Create: `lib/models/product.dart`

- [ ] **Step 1: Write the Product model**

```dart
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
```

- [ ] **Step 2: Ensure the file compiles**

Run:
```bash
flutter analyze lib/models/product.dart
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/models/product.dart
git commit -m "feat: add Product model"
```

---

### Task 3: Add the Hard-Coded Product Data Source

**Files:**
- Create: `lib/data/products.dart`

- [ ] **Step 1: Write at least 10 sample products**

```dart
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
    imageUrl: 'https://picsum.photos/seed/iphone15pro/300',
  ),
  const Product(
    id: 2,
    name: 'MacBook Air M3',
    price: 1299.00,
    description:
        'Lightning-fast M3 chip, stunning Liquid Retina display, and up to 18 hours of battery life.',
    imageUrl: 'https://picsum.photos/seed/macbookairm3/300',
  ),
  const Product(
    id: 3,
    name: 'Sony WH-1000XM5',
    price: 399.99,
    description:
        'Industry-leading noise cancellation, exceptional sound quality, and all-day comfort.',
    imageUrl: 'https://picsum.photos/seed/sonywh1000xm5/300',
  ),
  const Product(
    id: 4,
    name: 'iPad Air',
    price: 599.00,
    description:
        'Powerful M1 chip, 10.9-inch Liquid Retina display, and support for Apple Pencil.',
    imageUrl: 'https://picsum.photos/seed/ipadair/300',
  ),
  const Product(
    id: 5,
    name: 'Galaxy Watch 6',
    price: 299.99,
    description:
        'Advanced health tracking, sleep coaching, and a sleek circular design.',
    imageUrl: 'https://picsum.photos/seed/galaxywatch6/300',
  ),
  const Product(
    id: 6,
    name: 'Pixel 8 Pro',
    price: 899.00,
    description:
        'Google\'s most advanced Pixel with AI-powered photo and video features.',
    imageUrl: 'https://picsum.photos/seed/pixel8pro/300',
  ),
  const Product(
    id: 7,
    name: 'Dell XPS 13',
    price: 1199.00,
    description:
        'Compact, premium laptop with InfinityEdge display and Intel Core processors.',
    imageUrl: 'https://picsum.photos/seed/dellxps13/300',
  ),
  const Product(
    id: 8,
    name: 'AirPods Pro 2',
    price: 249.00,
    description:
        'Adaptive Audio, Active Noise Cancellation, and Personalized Spatial Audio.',
    imageUrl: 'https://picsum.photos/seed/airpodspro2/300',
  ),
  const Product(
    id: 9,
    name: 'Surface Pro 9',
    price: 999.99,
    description:
        'Versatile 2-in-1 laptop with a high-resolution touchscreen and all-day battery.',
    imageUrl: 'https://picsum.photos/seed/surfacepro9/300',
  ),
  const Product(
    id: 10,
    name: 'Garmin Fenix 7',
    price: 549.99,
    description:
        'Rugged multisport GPS smartwatch with advanced training and mapping features.',
    imageUrl: 'https://picsum.photos/seed/garminfenix7/300',
  ),
  const Product(
    id: 11,
    name: 'OnePlus 12',
    price: 799.99,
    description:
        'Flagship performance, Hasselblad cameras, and ultra-fast charging.',
    imageUrl: 'https://picsum.photos/seed/oneplus12/300',
  ),
  const Product(
    id: 12,
    name: 'Lenovo ThinkPad X1',
    price: 1399.00,
    description:
        'Legendary business laptop with a best-in-class keyboard and robust build quality.',
    imageUrl: 'https://picsum.photos/seed/thinkpadx1/300',
  ),
];
```

- [ ] **Step 2: Verify the data file compiles**

Run:
```bash
flutter analyze lib/data/products.dart
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/data/products.dart
git commit -m "feat: add hard-coded product catalog data"
```

---

### Task 4: Build the Product Card Widget

**Files:**
- Create: `lib/widgets/product_card.dart`

- [ ] **Step 1: Write the reusable ProductCard widget**

```dart
// lib/widgets/product_card.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

/// A card that displays a product image, name, and price.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'product-image-${product.id}',
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify the widget compiles**

Run:
```bash
flutter analyze lib/widgets/product_card.dart
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/widgets/product_card.dart
git commit -m "feat: add ProductCard widget with Hero animation"
```

---

### Task 5: Build the Product Detail Screen

**Files:**
- Create: `lib/screens/product_detail_screen.dart`

- [ ] **Step 1: Write the ProductDetailScreen widget**

```dart
// lib/screens/product_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

/// Displays detailed information about a selected product.
class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'product-image-${product.id}',
              child: Image.network(
                product.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onAddToCart,
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify the screen compiles**

Run:
```bash
flutter analyze lib/screens/product_detail_screen.dart
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/screens/product_detail_screen.dart
git commit -m "feat: add product detail screen with add-to-cart action"
```

---

### Task 6: Build the Home Screen

**Files:**
- Create: `lib/screens/home_screen.dart`

- [ ] **Step 1: Write the HomeScreen widget with cart state**

```dart
// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

/// Displays the product grid and manages the simulated cart count.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cartCount = 0;

  void _addToCart() {
    setState(() {
      cartCount++;
    });
  }

  void _navigateToDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
          onAddToCart: _addToCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Cart: $cartCount',
                style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
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
              onTap: () => _navigateToDetail(product),
            );
          },
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify the screen compiles**

Run:
```bash
flutter analyze lib/screens/home_screen.dart
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/screens/home_screen.dart
git commit -m "feat: add home screen with product grid and cart counter"
```

---

### Task 7: Wire Up the Application Entry Point

**Files:**
- Modify: `lib/main.dart`

- [ ] **Step 1: Replace the generated main.dart with the app bootstrap**

```dart
// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
```

- [ ] **Step 2: Verify the app compiles**

Run:
```bash
flutter analyze
```

Expected: No errors.

- [ ] **Step 3: Commit**

```bash
git add lib/main.dart
git commit -m "feat: wire up MaterialApp and home screen"
```

---

### Task 8: Update the Default Widget Test

**Files:**
- Modify: `test/widget_test.dart`

- [ ] **Step 1: Replace the default test with a catalog-specific test**

```dart
// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:software_persona_mobil/main.dart';

void main() {
  testWidgets('Product catalog displays products and increments cart', (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(const MyApp());

    // Verify the app title and initial cart count.
    expect(find.text('Product Catalog'), findsOneWidget);
    expect(find.text('Cart: 0'), findsOneWidget);

    // Verify at least one product is rendered.
    expect(find.byType(Card), findsWidgets);

    // Tap the first product card to open details.
    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    // Verify the detail screen shows an "Add to Cart" button.
    expect(find.text('Add to Cart'), findsOneWidget);

    // Tap "Add to Cart".
    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    // Navigate back and verify the cart count updated.
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Cart: 1'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run the widget test**

Run:
```bash
flutter test
```

Expected: Test passes.

- [ ] **Step 3: Commit**

```bash
git add test/widget_test.dart
git commit -m "test: add widget test for catalog and cart flow"
```

---

### Task 9: Add the README

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Replace the generated README with a complete project README**

```markdown
# Product Catalog

A beginner-friendly Flutter application that demonstrates fundamental Flutter concepts: widgets, navigation, UI design, data modeling, list/grid rendering, and basic state management.

## Features

- Browse products in a beautiful grid layout.
- Tap a product to view detailed information.
- Simulate adding products to a cart with a live counter in the AppBar.
- Smooth Hero animations between the product list and detail screens.
- Clean, multi-file project structure with separated concerns.

## Folder Structure

```
lib/
├── main.dart
├── models/
│   └── product.dart
├── data/
│   └── products.dart
├── screens/
│   ├── home_screen.dart
│   └── product_detail_screen.dart
└── widgets/
    └── product_card.dart
```

## Flutter Version Requirements

- Flutter 3.10 or higher
- Dart 3.0 or higher (null safety enabled)

## Installation

1. Ensure Flutter is installed: https://docs.flutter.dev/get-started/install
2. Clone or copy this project.
3. Run the following command in the project root to fetch dependencies:

```bash
flutter pub get
```

## Running the App

Connect a device or start an emulator, then run:

```bash
flutter run
```

To run for a specific platform:

```bash
flutter run -d android
flutter run -d ios
```

## Running Tests

```bash
flutter test
```

## Screenshots

| Home Screen | Product Detail |
|-------------|----------------|
| ![Home](screenshots/home.png) | ![Detail](screenshots/detail.png) |

> Add your own screenshots to a `screenshots/` folder and update the paths above.
```

- [ ] **Step 2: Commit**

```bash
git add README.md
git commit -m "docs: add complete project README"
```

---

### Task 10: Final Verification

**Files:**
- Verify: all files above

- [ ] **Step 1: Run static analysis**

Run:
```bash
flutter analyze
```

Expected: No issues found.

- [ ] **Step 2: Run all tests**

Run:
```bash
flutter test
```

Expected: All tests pass.

- [ ] **Step 3: Build for Android**

Run:
```bash
flutter build apk --debug
```

Expected: APK builds successfully.

- [ ] **Step 4: Final commit**

```bash
git add -A
git commit -m "chore: final verification and cleanup"
```

---

## Self-Review Checklist

- [ ] Spec coverage: every feature in `2026-06-15-flutter-product-catalog-design.md` maps to a task.
- [ ] No placeholders: every step includes exact code or commands.
- [ ] Type consistency: `Product`, `products`, `ProductCard`, `HomeScreen`, and `ProductDetailScreen` use matching names and signatures.
