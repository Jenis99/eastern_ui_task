import 'package:flutter/material.dart';

class MoreTabScreen extends StatelessWidget {
  const MoreTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More screen"),
      ),
      body: const Center(
        child: Text("This is more details"),
      ),
    );
  }

}
