import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int index = 0;

  final pages = [
    {"title": "Track Portfolio"},
    {"title": "AI Investment Signals"},
    {"title": "Achieve Goals"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: pages.length,
        onPageChanged: (i) => setState(() => index = i),
        itemBuilder: (_, i) {
          return Center(
            child: Text(
              pages[i]["title"]!,
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (index == pages.length - 1) {
            Navigator.pushReplacementNamed(context, "/login");
          } else {
            controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}