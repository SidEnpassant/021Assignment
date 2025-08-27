import 'package:tradeassignment/domain/entities/order.dart';
import 'package:tradeassignment/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<List<Order>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Order(
        time: '08:14:31',
        client: 'AAA001',
        ticker: 'RELIANCE',
        side: OrderSide.buy,
        product: 'CNC',
        executedQty: 50,
        totalQty: 100,
        price: 250.50,
      ),
      Order(
        time: '08:14:31',
        client: 'AAA003',
        ticker: 'MRF',
        side: OrderSide.buy,
        product: 'NRML',
        executedQty: 10,
        totalQty: 20,
        price: 2700.00,
      ),
      Order(
        time: '08:14:31',
        client: 'AAA002',
        ticker: 'ASIANPAINT',
        side: OrderSide.buy,
        product: 'NRML',
        executedQty: 10,
        totalQty: 30,
        price: 1500.60,
      ),
      Order(
        time: '08:14:31',
        client: 'AAA002',
        ticker: 'TATAINVEST',
        side: OrderSide.sell,
        product: 'INTRADAY',
        executedQty: 10,
        totalQty: 10,
        price: 2300.10,
      ),
      Order(
        time: '08:15:01',
        client: 'BBB001',
        ticker: 'INFY',
        side: OrderSide.sell,
        product: 'CNC',
        executedQty: 100,
        totalQty: 100,
        price: 1500.75,
      ),
      Order(
        time: '08:15:23',
        client: 'CCC005',
        ticker: 'HDFCBANK',
        side: OrderSide.buy,
        product: 'INTRADAY',
        executedQty: 25,
        totalQty: 50,
        price: 1450.20,
      ),
    ];
  }
}
