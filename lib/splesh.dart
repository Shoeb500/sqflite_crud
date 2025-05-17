import 'package:crud_sq/HomeScrren.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});
  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homescrren()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(
              "Splesh",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
            Text(
              "Screen",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
