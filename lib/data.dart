import 'dart:io';

import 'category.dart';


class AppData {

  static List<Category> categoryList = [
    Category(),
    Category(id: 1, name: "سيارات و  آليات", image: 'assets/cars.png'),
    Category(id: 2, name: "عقارات", image: 'assets/realestate.png'),
    Category(id: 3, name: "ازياء موضة تجميل", image: 'assets/fashion.png'),
    Category(id: 4, name: "الكترونيات", image: 'assets/electronics.png'),
    Category(id: 5, name: "موبايل تابليت", image: 'assets/mobile.png'),
    Category(id: 6, name: "فرص عمل", image: 'assets/job.png'),
    Category(id: 7, name: "خدمات", image: 'assets/services.png'),
    Category(id: 8, name: "مطاعم", image: 'assets/food.png'),
    Category(id: 9, name: "اثاث", image: 'assets/furniture.png'),
    Category(id: 10, name: "العاب", image: 'assets/gaming.png'),


  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
