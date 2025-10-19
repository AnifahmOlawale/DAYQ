import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/theme_color_provider.dart';

class AppbarSystemStyle {
  SystemUiOverlayStyle appbarSystemStyle(BuildContext context) {
    final themeColorProvider = Provider.of<ThemeColor>(context);

    return SystemUiOverlayStyle(
      systemNavigationBarColor: themeColorProvider.primary,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: themeColorProvider.primary ??
          Theme.of(context).scaffoldBackgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
  }
}
