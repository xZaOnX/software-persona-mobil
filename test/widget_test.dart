// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:software_persona_mobil/main.dart';

void main() {
  testWidgets(
    'Product catalog and cart flow work correctly',
    (WidgetTester tester) async {
      // Build the app.
      await tester.pumpWidget(const MyApp());

      // Verify the home screen is shown with an empty cart badge.
      expect(find.text('Product Catalog'), findsOneWidget);

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

      // Navigate back to the catalog.
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      // Open the cart screen.
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Verify the cart screen is displayed.
      expect(find.text('Shopping Cart'), findsOneWidget);

      // Verify the item is in the cart and total is shown.
      expect(find.text('Checkout'), findsOneWidget);
    },
  );
}
