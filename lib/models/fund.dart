class Fund {
  String name;
  double amount;
  double nav;

  Fund({required this.name, required this.amount, this.nav = 0});

  double get value => amount * nav;

  String get bucket {
    String n = name.toLowerCase();

    if (n.contains("large") || n.contains("index")) {
      return "Stability";
    }
    if (n.contains("dividend") || n.contains("income")) {
      return "Income";
    }
    return "Growth";
  }
}