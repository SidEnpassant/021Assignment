import 'package:flutter/material.dart';
import 'package:tradeassignment/core/styles.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      color: const Color(0xFF2D3748),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.show_chart, color: Colors.orange, size: 28),
            const SizedBox(width: 16),
            _buildTickerItem('SIGNORIA', '0.00', isNegative: true),
            _buildTickerItem('NIFTY BANK', '52,323.30'),
            _buildTickerItem('NIFTY FIN SERVICE', '25,255.75'),
            _buildTickerItem('RELCHEMQ', '162.73'),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTickerItem(
    String name,
    String value, {
    bool isNegative = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: tickerSymbolStyle.copyWith(color: Colors.white70)),
          const SizedBox(height: 4),
          Text(
            value,
            style: isNegative
                ? tickerValueNegativeStyle
                : tickerValuePositiveStyle,
          ),
        ],
      ),
    );
  }
}
