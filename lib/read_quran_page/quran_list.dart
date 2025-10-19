import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/quran_csv_provider.dart';
import 'package:quran_app/provider/theme_color_provider.dart';
import 'package:quran_app/read_quran_page/quran_bookmark_widget.dart';
import 'package:quran_app/read_quran_page/quran_list_widget.dart';
import 'package:quran_app/util/appbar_system_style.dart';
import 'package:quran_app/util/value_notifier.dart';

class QuranList extends StatelessWidget {
  const QuranList({
    super.key,
  });

  void preloadImages(BuildContext context) {
    precacheImage(AssetImage("assets/images/star.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    final themeColorProvider = Provider.of<ThemeColor>(context);
    final quranCsv = Provider.of<QuranCsv>(context);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        quranCsv.initTrans();
      },
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppbarSystemStyle().appbarSystemStyle(context),
        child: ValueListenableBuilder(
          valueListenable: quranListSwitch,
          builder: (context, navIndexValue, child) => Scaffold(
            backgroundColor: themeColorProvider.secondary,
            body: SafeArea(
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      child: IndexedStack(
                        index: navIndexValue,
                        children: [
                          //Show Quran if index=0
                          if (quranCsv.listOfSurahs.isNotEmpty)
                            QuranListWidget(),
                          //Show Bookmark if index=1
                          QuranBookmarkWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: themeColorProvider.background,
              selectedItemColor: themeColorProvider.primary,
              currentIndex: navIndexValue,
              onTap: (value) => quranListSwitch.value = value,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book), label: "Read Qur'an"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark), label: "Bookmarks"),
              ],
            ),
          ),
        ));
  }
}
