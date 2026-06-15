# Local Product Images Design Spec

**Project:** software_persona_mobil  
**Date:** 2026-06-15  
**Status:** Approved

## 1. Goal

Replace the network-based `picsum.photos` placeholder images with locally stored product images sourced from manufacturer/official sites. Update the Flutter app to load images from bundled assets.

## 2. Requirements Summary

- No external packages.
- No Firebase.
- Continue using only built-in Flutter/Dart tools.
- Maintain the existing folder structure and state-management approach.
- Keep the UI beautiful and the code clean.

## 3. Changes

### 3.1 Asset Storage

Create an `assets/images/` directory at the project root. Each product will have one image file stored there, named after the product slug (e.g., `iphone15pro.jpg`).

### 3.2 Product Model

Rename the `imageUrl` field to `imageAsset` in `lib/models/product.dart`. The new field will hold a Flutter asset path such as `assets/images/iphone15pro.jpg`.

### 3.3 Product Data

Update `lib/data/products.dart` so that every `Product` uses its local asset path instead of a remote URL.

### 3.4 UI Widgets

Replace `Image.network(...)` with `Image.asset(...)` in:
- `lib/widgets/product_card.dart`
- `lib/screens/product_detail_screen.dart`

Keep the existing `errorBuilder` fallback so missing or broken assets show a placeholder icon instead of crashing.

### 3.5 Pubspec Registration

Register the asset directory in `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

### 3.6 Image Acquisition

Use web search to locate official product images for each of the 12 catalog items, then download them with `curl` into `assets/images/`.

## 4. Updated File Structure

```
assets/
└── images/
    ├── iphone15pro.jpg
    ├── macbookairm3.jpg
    ├── sonywh1000xm5.jpg
    ├── ipadair.jpg
    ├── galaxywatch6.jpg
    ├── pixel8pro.jpg
    ├── dellxps13.jpg
    ├── airpodspro2.jpg
    ├── surfacepro9.jpg
    ├── garminfenix7.jpg
    ├── oneplus12.jpg
    └── thinkpadx1.jpg

lib/
├── main.dart
├── models/
│   └── product.dart       # imageUrl → imageAsset
├── data/
│   └── products.dart      # asset paths
├── screens/
│   ├── home_screen.dart
│   └── product_detail_screen.dart   # Image.asset
└── widgets/
    └── product_card.dart              # Image.asset
```

## 5. Copyright Notice

Manufacturer product images are typically copyrighted. This implementation is intended for an internal/educational internship demo. The images should not be published to an app store or used in a public/commercial project without proper licensing.

## 6. Verification

- `flutter analyze` reports no issues.
- `flutter test` passes.
- `flutter build apk --debug` succeeds.
- The app displays local images on both the home grid and the detail screen.
