import 'package:flutter/material.dart';
import 'package:tradeassignment/core/styles.dart';
import 'package:tradeassignment/domain/entities/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.ticker, style: headingStyle.copyWith(fontSize: 18)),
                Text(
                  order.side == OrderSide.buy ? 'BUY' : 'SELL',
                  style: order.side == OrderSide.buy
                      ? buyTextStyle
                      : sellTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(order.product, style: tableHeaderStyle),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn('Client', order.client),
                _buildInfoColumn(
                  'Qty (Exec/Total)',
                  '${order.executedQty}/${order.totalQty}',
                ),
                _buildInfoColumn(
                  'Price',
                  '₹${order.price.toStringAsFixed(2)}',
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.time, style: tableHeaderStyle),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF718096)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    String title,
    String value, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: tableHeaderStyle),
        const SizedBox(height: 4),
        Text(value, style: tableCellStyle),
      ],
    );
  }
}
