import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.white),
      body: body,
      backgroundColor: Colors.white,
    );
  }
}
