import 'package:flutter/material.dart';

class SaleTabScreen extends StatelessWidget {
  const SaleTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sale screen"),
      ),
      body: const Center(
        child: Text("This is sales details"),
      ),
    );
  }
}
