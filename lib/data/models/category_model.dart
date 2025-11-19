class CategoryModel{
  final String? lightImage;
  final String? darkImage;
  final String title;
  final String? id;

  CategoryModel(this.title, this.lightImage, this.darkImage, this.id);
  
  static List<CategoryModel> categories = [
    CategoryModel('General', 'assets/general.png', 'assets/general_dark.png', 'general'),
    CategoryModel('Business', 'assets/busniess.png', 'assets/busniess_dark.png', 'business'),
    CategoryModel('Entertainment', 'assets/entertainment.png', 'assets/entertainment_dark.png', 'entertainment'),
    CategoryModel('Health', 'assets/helth.png', 'assets/helth_dark.png', 'health'),
    CategoryModel('Science', 'assets/science.png', 'assets/science_dark.png', 'science'),
    CategoryModel('Technology', 'assets/technology.png', 'assets/technology_dark.png', 'technology'),
    CategoryModel('Sports', 'assets/sport.png', 'assets/sport_dark.png', 'sports'),
  ];
}