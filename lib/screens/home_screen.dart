import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/fund.dart';
import '../services/ai_engine.dart';
import '../widgets/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Fund> funds = [];
  double nifty = 24000;
  List<double> history = [];
  double sip = 10000;

  double get total =>
      funds.fold(0, (sum, f) => sum + f.value);

  double get dip {
    if (history.isEmpty) return 0;
    double high = history.reduce((a, b) => a > b ? a : b);
    return ((nifty - high) / high) * 100;
  }

  Map<String, double> allocation() {
    Map<String, double> map = {
      "Stability": 0,
      "Income": 0,
      "Growth": 0
    };

    for (var f in funds) {
      map[f.bucket] = map[f.bucket]! + f.value;
    }

    return map;
  }

  Widget pie() {
    final data = allocation();

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: data.entries.map((e) {
            return PieChartSectionData(
              value: e.value,
              title: e.key,
            );
          }).toList(),
        ),
      ),
    );
  }

  void addFund() {
    setState(() {
      funds.add(Fund(name: "Large Cap Fund", amount: 10, nav: 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    history.add(nifty);
    if (history.length > 90) history.removeAt(0);

    return Scaffold(
      appBar: AppBar(title: const Text("SIP AI v14")),
      floatingActionButton:
          FloatingActionButton(onPressed: addFund, child: const Icon(Icons.add)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassCard(
              child: Text("Portfolio ₹${total.toStringAsFixed(0)}")),
          GlassCard(child: Text("Dip ${dip.toStringAsFixed(2)}%")),
          GlassCard(child: Text(AIEngine.signal(dip))),
          GlassCard(child: pie()),
        ],
      ),
    );
  }
}