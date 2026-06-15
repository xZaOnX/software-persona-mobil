# Flutter Product Catalog App — Design Spec

**Project:** software_persona_mobil  
**Package:** com.softwarepersona.mobil  
**Date:** 2026-06-15  
**Status:** Approved

## 1. Goal

Build a beginner-level educational Flutter application that demonstrates fundamental concepts: widgets, navigation, UI design, data modeling, list/grid rendering, and basic state management using only built-in Flutter/Dart tools.

## 2. Requirements Summary

- Flutter and Dart only; no external packages unless absolutely necessary.
- No Firebase.
- No third-party state-management libraries (Provider, Riverpod, Bloc, GetX, etc.).
- Built-in Material Design components only.
- Null safety enabled.
- Clean, readable, maintainable code organized into multiple files and folders.
- At least 10 hard-coded sample products across categories: Smartphones, Laptops, Headphones, Tablets, Smart Watches.

## 3. Features

1. **Home Screen**
   - Displays products in a `GridView.builder`.
   - Each product is rendered as a `Card` with rounded corners, image, name, and price.
   - Tapping a card navigates to the product details screen.
   - AppBar displays the current cart count: `Cart: N`.

2. **Product Details Screen**
   - Displays large product image (with `Hero` animation), name, price, description.
   - Contains an "Add to Cart" `ElevatedButton`.

3. **Cart Simulation**
   - `HomeScreen` owns an `int cartCount`.
   - Tapping "Add to Cart" increments `cartCount` via `setState()`.
   - Cart count is shown in the `HomeScreen` AppBar.

## 4. Architecture

- **Models:** `Product` class (`lib/models/product.dart`).
- **Data:** `products` list (`lib/data/products.dart`).
- **Screens:** `HomeScreen` and `ProductDetailScreen` (`lib/screens/`).
- **Widgets:** `ProductCard` (`lib/widgets/product_card.dart`).
- **Entry:** `main.dart` bootstraps the app.

### Data Flow

```
main.dart
 └── MaterialApp
      └── HomeScreen (StatefulWidget, owns cartCount)
            ├── AppBar: Cart: cartCount
            └── GridView.builder
                 └── ProductCard (onTap)
                      └── Navigator.push → ProductDetailScreen
                            └── onAddToCart callback
                                 └── HomeScreen.setState(() => cartCount++)
```

## 5. State Management

- `StatefulWidget` + `setState()` only.
- `HomeScreen` holds `cartCount`.
- `ProductDetailScreen` receives a `VoidCallback onAddToCart`; invoking it triggers the increment and rebuilds the home screen.

## 6. Project Structure

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

## 7. UI/UX Decisions

- Material Design 3 theming via `ThemeData`.
- `Card` widgets with `RoundedRectangleBorder` for consistent rounded corners.
- `GridView.builder` with `SliverGridDelegateWithFixedCrossAxisCount` for a 2-column layout.
- `Hero` widget wraps product images to provide a smooth transition between list and detail.
- Placeholder images served from `https://picsum.photos/seed/{id}/300` for stable, public URLs.
- Consistent `Padding`, `SizedBox`, and `EdgeInsets` values throughout.

## 8. Code Quality

- Meaningful variable names and Flutter naming conventions.
- `const` constructors where possible.
- Comments for important sections.
- No duplicated UI code; reusable `ProductCard` widget.
- Null-safe Dart code.

## 9. Dependencies

- Flutter SDK only.
- `cupertino_icons` is acceptable as a default Flutter-generated dependency if present, but no functionality depends on it.

## 10. README

The project will include a `README.md` with:
- Project title and description
- Features list
- Folder structure
- Flutter version requirements
- Installation and running instructions
- Screenshots section placeholders
