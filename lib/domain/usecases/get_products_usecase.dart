import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}