import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() {
    return remoteDataSource.fetchProducts();
  }
}