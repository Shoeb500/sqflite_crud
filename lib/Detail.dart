import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String? name;
  final String? title;
  final String Desc;
  const DetailScreen({super.key, this.name, this.title, required this.Desc});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
