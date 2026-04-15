class AIEngine {
  static String signal(double dip) {
    if (dip <= -7) return "🚀 Strong Buy";
    if (dip <= -4) return "✅ Buy";
    if (dip <= -2) return "⚖️ Partial Buy";
    return "⏳ Hold";
  }

  static double suggested(double sip, double dip) {
    if (dip <= -7) return sip * 2;
    if (dip <= -4) return sip * 1.5;
    if (dip <= -2) return sip * 1.2;
    return sip;
  }
}