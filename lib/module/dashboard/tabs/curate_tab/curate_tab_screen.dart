import 'package:flutter/material.dart';

class CurateTabScreen extends StatelessWidget {
  const CurateTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curate screen"),
      ),
      body: const Center(
        child: Text("This is Curate details"),
      ),
    );
  }
}
