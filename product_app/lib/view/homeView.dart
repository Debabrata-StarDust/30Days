import 'package:flutter/material.dart';
import 'package:product_app/widgets/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: AppBar(
        centerTitle: true,
        title: Text("Catalog"),
      ),
    );
  }
}
