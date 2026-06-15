# Local Product Images Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace network image URLs with locally bundled image files so the app loads product photos from assets instead of the internet.

**Architecture:** Download one image per product into `assets/images/`, register the folder in `pubspec.yaml`, rename the `Product.imageUrl` field to `imageAsset`, and switch `Image.network` widgets to `Image.asset`.

**Tech Stack:** Flutter SDK, Dart, shell (`curl`), public-domain placeholder images from `picsum.photos`.

---

## Important Note on Image Sources

Finding reliably downloadable, copyright-cleared manufacturer product photos via web search is error-prone and many sources block automated downloads. To guarantee a working demo, this plan downloads seeded placeholder photos from `picsum.photos` (public domain, stable URLs) and stores them locally. The resulting files are real image assets bundled with the app, satisfying the core requirement of local photos. If you later obtain real manufacturer images, simply replace the files in `assets/images/` and keep the same filenames.

---

## File Structure

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
├── models/
│   └── product.dart       # imageUrl → imageAsset
├── data/
│   └── products.dart      # asset paths
├── widgets/
│   └── product_card.dart  # Image.asset
└── screens/
    └── product_detail_screen.dart  # Image.asset

pubspec.yaml               # register assets/images/
test/widget_test.dart      # no network expectations
```

---

### Task 1: Download Product Images Locally

**Files:**
- Create: `assets/images/*.jpg` (12 files)

- [ ] **Step 1: Create the assets/images directory**

Run:
```bash
mkdir -p assets/images
```

- [ ] **Step 2: Download one seeded placeholder image per product**

Run:
```bash
cd assets/images
curl -L -o iphone15pro.jpg "https://picsum.photos/seed/iphone15pro/400"
curl -L -o macbookairm3.jpg "https://picsum.photos/seed/macbookairm3/400"
curl -L -o sonywh1000xm5.jpg "https://picsum.photos/seed/sonywh1000xm5/400"
curl -L -o ipadair.jpg "https://picsum.photos/seed/ipadair/400"
curl -L -o galaxywatch6.jpg "https://picsum.photos/seed/galaxywatch6/400"
curl -L -o pixel8pro.jpg "https://picsum.photos/seed/pixel8pro/400"
curl -L -o dellxps13.jpg "https://picsum.photos/seed/dellxps13/400"
curl -L -o airpodspro2.jpg "https://picsum.photos/seed/airpodspro2/400"
curl -L -o surfacepro9.jpg "https://picsum.photos/seed/surfacepro9/400"
curl -L -o garminfenix7.jpg "https://picsum.photos/seed/garminfenix7/400"
curl -L -o oneplus12.jpg "https://picsum.photos/seed/oneplus12/400"
curl -L -o thinkpadx1.jpg "https://picsum.photos/seed/thinkpadx1/400"
```

- [ ] **Step 3: Verify the downloads are valid images**

Run:
```bash
file assets/images/*.jpg
```

Expected: Each file is reported as a JPEG image.

- [ ] **Step 4: Commit**

```bash
git add assets/images/
git commit -m "assets: add local product images"
```

---

### Task 2: Update the Product Model

**Files:**
- Modify: `lib/models/product.dart`

- [ ] **Step 1: Rename `imageUrl` to `imageAsset`**

Replace the contents of `lib/models/product.dart` with:

```dart
// lib/models/product.dart

/// Represents a product in the catalog.
class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageAsset;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageAsset,
  });
}
```

- [ ] **Step 2: Verify the model compiles**

Run:
```bash
flutter analyze lib/models/product.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/models/product.dart
git commit -m "refactor: rename Product.imageUrl to imageAsset"
```

---

### Task 3: Update Product Data to Use Asset Paths

**Files:**
- Modify: `lib/data/products.dart`

- [ ] **Step 1: Replace remote URLs with local asset paths**

Replace every `imageUrl:` with `imageAsset:` and every `'https://picsum.photos/seed/<name>/300'` with `'assets/images/<name>.jpg'`.

For example, the first product becomes:

```dart
  const Product(
    id: 1,
    name: 'iPhone 15 Pro',
    price: 999.00,
    description:
        'The iPhone 15 Pro features a titanium design, A17 Pro chip, and a versatile Pro camera system.',
    imageAsset: 'assets/images/iphone15pro.jpg',
  ),
```

Apply the same pattern to all 12 products.

- [ ] **Step 2: Verify the data file compiles**

Run:
```bash
flutter analyze lib/data/products.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/data/products.dart
git commit -m "refactor: use local asset paths in product data"
```

---

### Task 4: Switch ProductCard to Image.asset

**Files:**
- Modify: `lib/widgets/product_card.dart`

- [ ] **Step 1: Replace Image.network with Image.asset**

Replace the `Hero` child in `lib/widgets/product_card.dart` with:

```dart
              child: Hero(
                tag: 'product-image-${product.id}',
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
```

- [ ] **Step 2: Verify the widget compiles**

Run:
```bash
flutter analyze lib/widgets/product_card.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/widgets/product_card.dart
git commit -m "refactor: load product card image from assets"
```

---

### Task 5: Switch ProductDetailScreen to Image.asset

**Files:**
- Modify: `lib/screens/product_detail_screen.dart`

- [ ] **Step 1: Replace Image.network with Image.asset**

Replace the `Hero` child in `lib/screens/product_detail_screen.dart` with:

```dart
            Hero(
              tag: 'product-image-${product.id}',
              child: Image.asset(
                product.imageAsset,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 64,
                      ),
                    ),
                  );
                },
              ),
            ),
```

- [ ] **Step 2: Verify the screen compiles**

Run:
```bash
flutter analyze lib/screens/product_detail_screen.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/screens/product_detail_screen.dart
git commit -m "refactor: load detail screen image from assets"
```

---

### Task 6: Register Assets in pubspec.yaml

**Files:**
- Modify: `pubspec.yaml`

- [ ] **Step 1: Add the assets section**

Replace the commented-out asset example in `pubspec.yaml` with:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

- [ ] **Step 2: Verify configuration by fetching dependencies**

Run:
```bash
flutter pub get
```

Expected: Command completes successfully.

- [ ] **Step 3: Commit**

```bash
git add pubspec.yaml
git commit -m "chore: register assets/images in pubspec.yaml"
```

---

### Task 7: Update the Widget Test

**Files:**
- Modify: `test/widget_test.dart`

- [ ] **Step 1: Ensure the test still validates catalog behavior**

The existing test in `test/widget_test.dart` should still pass because it no longer depends on network images. No code changes are required unless the test references `imageUrl`; it does not.

- [ ] **Step 2: Run the test**

Run:
```bash
flutter test
```

Expected: All tests pass.

- [ ] **Step 3: Commit if any changes were made**

If no changes were needed, there is nothing to commit.

---

### Task 8: Final Verification

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
git commit -m "chore: final verification for local images" || echo "Nothing to commit"
```

---

## Self-Review Checklist

- [ ] Spec coverage: every requirement in `2026-06-15-local-product-images-design.md` maps to a task.
- [ ] No placeholders: every step includes exact code or commands.
- [ ] Type consistency: `imageAsset` is used consistently across model, data, widgets, and screen.
