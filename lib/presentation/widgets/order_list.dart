import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradeassignment/presentation/provider/order_provider.dart';
import 'order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return ListView.builder(
        itemCount: provider.filteredOrders.length,
        itemBuilder: (context, index) {
          final order = provider.filteredOrders[index];
          return OrderCard(order: order);
        },
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: const [], rows: const []),
      );
    }
  }
}
