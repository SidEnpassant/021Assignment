import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/orders_page.dart';
import 'presentation/provider/order_provider.dart';
import 'domain/usecases/get_orders.dart';
import 'data/repositories/order_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          OrderProvider(getOrders: GetOrders(OrderRepositoryImpl()))
            ..fetchOrders(),
      child: MaterialApp(
        title: 'Flutter Orders App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Inter',
          scaffoldBackgroundColor: const Color(0xFFF7FAFC),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.5,
            iconTheme: IconThemeData(color: Color(0xFF1A202C)),
          ),
        ),
        home: const OrdersPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
