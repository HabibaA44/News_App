class AppCategorys {
  String cId;

  String cName;
  AppCategorys({required this.cId, required this.cName});

  static List<AppCategorys> category = [
    AppCategorys(cId: "general", cName: "General"),
    AppCategorys(cId: "business", cName: "Business"),
    AppCategorys(cId: "sport", cName: "Sport"),
    AppCategorys(cId: "technology", cName: "Technology"),
    AppCategorys(cId: "intertenment", cName: "Intertenment"),
    AppCategorys(cId: "health", cName: "Health"),
    AppCategorys(cId: "science", cName: "Science"),
  ];
}
