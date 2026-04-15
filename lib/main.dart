import 'package:flutter/material.dart';

void main() {
  runApp(const SIPApp());
}

class SIPApp extends StatelessWidget {
  const SIPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIP AI',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIP AI Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CardWidget("Today's Signal", "Invest ₹10,000"),
            CardWidget("Market Dip", "-4.3%"),
            CardWidget("Goal Progress", "42%"),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String value;

  const CardWidget(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}