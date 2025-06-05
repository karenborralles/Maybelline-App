import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/detail_page.dart';
import '../domain/entities/product.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: '/detail',
      pageBuilder: (context, state) {
        final product = state.extra as Product;
        return MaterialPage(child: DetailPage(product: product));
      },
    ),
  ],
);
