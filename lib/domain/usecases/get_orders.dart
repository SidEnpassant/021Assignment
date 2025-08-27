import 'package:tradeassignment/domain/entities/order.dart';
import 'package:tradeassignment/domain/repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  Future<List<Order>> call() {
    return repository.getOrders();
  }
}
