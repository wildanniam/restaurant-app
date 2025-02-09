import 'package:flutter/material.dart';

enum RestaurantColor {
  // Primary Color (Orange-based)
  primary("Primary", Color(0xFFF89721)), // Warna utama (orange)
  darkPrimary("Dark Primary", Color(0xFF217346)), // Warna utama gelap
  secondaryButton("Secondary Button", Color.fromRGBO(235, 246, 238, 1)),

  // Error & Warning
  error("Error", Color(0xFFD00000)),
  warning("Warning", Color(0xFFF99500)),

  // Produk-related (Rekomendasi palet dengan nuansa orange yang lebih netral)
  produkBackground(
      "Produk Background",
      Color.fromARGB(
          255, 250, 183, 95)), // Warna latar produk bernuansa orange muda
  produkAccent("Produk Accent",
      Color(0xFFFFAB66)), // Aksen produk dengan orange yang lebih terang
  produkShadow("Produk Shadow",
      Color(0xFF3D4754)), // Shadow tetap dengan warna original, lebih netral

  // General Colors
  border("Border", Color(0xFFE1E1E1)),
  bottomNavigationBar("Bottom Navigation Bar", Color(0xFFAAAAAA)),
  white("White", Colors.white),
  black("Black", Colors.black),

  // Placeholder & Fonts
  placeHolder("Placeholder", Color(0xFFEAEAEA)),
  placeHolder2("Placeholder 2", Color(0xFF807474)),
  placeHolderIcon("Placeholder Icon", Color(0xFFBDBDBD)),
  fontPrimary("Primary Font", Color(0xFF1E1E1E)),
  fontSecondary("Secondary Font", Color(0xFF5D5F60)),
  fontGrey("Font Grey", Color(0xFF686868)),

  // Grey Shades
  grey1("Grey 1", Color(0xFFAEB2B7)),
  grey2("Grey 2", Color(0xFF858597)),
  grey3("Grey 3", Color(0xFFB0AAAA)),
  grey4("Grey 4", Color(0xFFD9D9D9)),
  boxGrey("Box Grey", Color(0xFFD3D3D3)),

  // Secondary Colors
  secondaryBackground("Secondary Background", Color(0xFFF4FBF7)),

  // Light Colors
  lightGreen("Light Green", Color(0xFFF2F5EB)),
  lightBlue("Light Blue", Color(0xFFC5E4FB)),
  lightYellow("Light Yellow", Color(0xFFFCF7C8)),
  lightPurple("Light Purple", Color(0xFFEFEBFF));

  const RestaurantColor(this.name, this.color);

  final String name;
  final Color color;
}
