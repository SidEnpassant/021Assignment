import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradeassignment/core/styles.dart';
import 'package:tradeassignment/presentation/provider/order_provider.dart';
import 'package:tradeassignment/presentation/widgets/app_drawer.dart';
import 'package:tradeassignment/presentation/widgets/filter_bar.dart';
import 'package:tradeassignment/presentation/widgets/market_header.dart';
import 'package:tradeassignment/presentation/widgets/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('Open Orders', style: headingStyle),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Download logic
              },
              icon: const Icon(Icons.download_outlined),
              label: const Text('Download'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDF2F7),
                foregroundColor: const Color(0xFF2D3748),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const CircleAvatar(
            backgroundColor: Color(0xFFE2E8F0),
            child: Text(
              'LK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const MarketHeader(),
          const FilterBar(),
          Expanded(
            child: Consumer<OrderProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (provider.filteredOrders.isEmpty) {
                  return const Center(child: Text('No open orders.'));
                }
                return const OrderList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
