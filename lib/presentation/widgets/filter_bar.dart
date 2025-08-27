import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradeassignment/core/styles.dart';
import 'package:tradeassignment/presentation/provider/order_provider.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final clientController = TextEditingController(text: 'AAA002');

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: clientController,
                  decoration: InputDecoration(
                    hintText: 'Client ID',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.person_add_alt_1_outlined),
                      onPressed: () {
                        if (clientController.text.isNotEmpty) {
                          provider.addClientFilter(clientController.text);
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Chip(
                label: const Text('Lalit', style: filterTextStyle),
                backgroundColor: const Color(0xFFEDF2F7),
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a stock, future, option or index',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF718096),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => provider.cancelAllOrders(),
                icon: Icon(Icons.cancel_outlined, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53E3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),

                label: const Text(
                  'Cancel all',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              ...provider.activeTickerFilters.map(
                (filter) => Chip(
                  label: Text(
                    filter,
                    style: filterTextStyle.copyWith(
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  backgroundColor: const Color(0xFFEDF2F7),
                  onDeleted: () => provider.removeTickerFilter(filter),
                  deleteIcon: const Icon(Icons.close, size: 16),
                ),
              ),
              ...provider.activeClientFilters.map(
                (filter) => Chip(
                  label: Text(
                    filter,
                    style: filterTextStyle.copyWith(
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  backgroundColor: const Color(0xFFE2E8F0),
                  onDeleted: () => provider.removeClientFilter(filter),
                  deleteIcon: const Icon(Icons.close, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
