import 'package:flutter/material.dart';
import 'package:flutter_store_app/views/screens/navs_screen/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [HeaderWidget()]),
    ));
  }
}
