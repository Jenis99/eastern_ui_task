import 'package:eastern_ecommerce_app/module/dashboard/tabs/home_tab/view/home_screen.dart';
import 'package:eastern_ecommerce_app/module/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
