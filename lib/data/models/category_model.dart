class Category{
  final String? lightImage;
  final String? darkImage;
  final String title;

  Category(this.title, this.lightImage, this.darkImage);
  
  static List<Category> categories = [
    Category('General', 'assets/general.png', 'assets/general_dark.png'),
    Category('Business', 'assets/busniess.png', 'assets/busniess_dark.png'),
    Category('Entertainment', 'assets/entertainment.png', 'assets/entertainment_dark.png'),
    Category('Health', 'assets/helth.png', 'assets/helth_dark.png'),
    Category('Science', 'assets/science.png', 'assets/science_dark.png'),
    Category('Technology', 'assets/technology.png', 'assets/technology_dark.png'),
    Category('Sport', 'assets/sport.png', 'assets/sport_dark.png'),
  ];
}