import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories_impl/product_repository_impl.dart';
import 'domain/usecases/get_products_usecase.dart';
import 'presentation/blocs/product_bloc.dart';
import 'routes/app_router.dart';
import 'presentation/blocs/product_event.dart';

void main() {
  final dataSource = ProductRemoteDataSource();
  final repository = ProductRepositoryImpl(dataSource);
  final getProductsUseCase = GetProductsUseCase(repository);

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  const MyApp({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maybelline Catalog',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.pink),
      builder: (context, child) {
        return BlocProvider(
          create: (_) => ProductBloc(getProductsUseCase)..add(LoadProducts()),
          child: child!,
        );
      },
    );
  }
}