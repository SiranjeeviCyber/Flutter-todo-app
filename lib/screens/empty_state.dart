import 'package:flutter/material.dart';
class EmptyState extends StatefulWidget {
  const EmptyState({super.key});
  @override
  State<EmptyState> createState() => _MyEmptyState();
  }
  class _MyEmptyState extends State<EmptyState> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Image.asset('assets/emptyStateImage2.png'),
        ],
      ),
    );
  }
}
