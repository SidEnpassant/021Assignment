import 'package:flutter/foundation.dart';
import 'package:tradeassignment/domain/entities/order.dart';
import 'package:tradeassignment/domain/usecases/get_orders.dart';

class OrderProvider with ChangeNotifier {
  final GetOrders getOrders;
  List<Order> _orders = [];
  List<Order> _filteredOrders = [];
  bool _isLoading = true;
  final Set<String> _activeTickerFilters = {'RELIANCE', 'ASIANPAINT'};
  final Set<String> _activeClientFilters = {'AAA002'};

  OrderProvider({required this.getOrders});

  List<Order> get filteredOrders => _filteredOrders;
  bool get isLoading => _isLoading;
  Set<String> get activeTickerFilters => _activeTickerFilters;
  Set<String> get activeClientFilters => _activeClientFilters;

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();
    try {
      _orders = await getOrders();
      _applyFilters();
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _applyFilters() {
    _filteredOrders = _orders.where((order) {
      final tickerMatch =
          _activeTickerFilters.isEmpty ||
          _activeTickerFilters.contains(order.ticker);
      final clientMatch =
          _activeClientFilters.isEmpty ||
          _activeClientFilters.contains(order.client);
      return tickerMatch && clientMatch;
    }).toList();
    notifyListeners();
  }

  void addTickerFilter(String filter) {
    _activeTickerFilters.add(filter);
    _applyFilters();
  }

  void removeTickerFilter(String filter) {
    _activeTickerFilters.remove(filter);
    _applyFilters();
  }

  void addClientFilter(String filter) {
    _activeClientFilters.add(filter);
    _applyFilters();
  }

  void removeClientFilter(String filter) {
    _activeClientFilters.remove(filter);
    _applyFilters();
  }

  void cancelAllOrders() {
    _orders.clear();
    _filteredOrders.clear();
    notifyListeners();
  }
}
