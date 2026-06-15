// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:software_persona_mobil/main.dart';

void main() {
  testWidgets(
    'Product catalog displays products and increments cart',
    (WidgetTester tester) async {
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
    },
  );
}
