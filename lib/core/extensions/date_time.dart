extension DT on DateTime {
  String get dmy {
    return "${day.toString().padLeft(2,"0")}.${day.toString().padLeft(2,"0")}.$year";
  }
}