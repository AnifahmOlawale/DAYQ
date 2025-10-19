import 'package:flutter/material.dart';
import 'package:quran_app/read_quran_page/quran_list.dart';
import 'package:quran_app/settings/settings.dart';
import 'package:quran_app/util/app_info.dart';
import 'package:quran_app/util/download_more_app.dart';
import 'package:quran_app/util/hijri_date_converter.dart';
import 'package:quran_app/util/launch_url.dart';
import 'package:quran_app/widget_tree/listwidget.dart';

class HomeNavigationList extends StatelessWidget {
  final bool playerListPage;
  final List<String> homeListTitle;
  final List<Icon> homeListIcons;
  final VoidCallback listController;
  const HomeNavigationList({
    super.key,
    required this.playerListPage,
    required this.homeListTitle,
    required this.homeListIcons,
    required this.listController,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !playerListPage,
      child: Scrollbar(
        radius: Radius.circular(100),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeListTitle.length,
                itemBuilder: (context, index) {
                  return homeListTile(
                    context,
                    title: homeListTitle.elementAt(index),
                    icon: homeListIcons.elementAt(index),
                    onCardClick: () {
                      switch (index) {
                        case 0:

                          //Open Audio Player Page
                          listController();

                          //
                          break;
                        case 1:
                          //convert date
                          convertDate(context);
                          break;
                        case 2:
                          //Open Read Quran Page
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuranList(),
                          ));
                          break;
                        case 3:
                          //Open Settings Page
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Settings()));
                          break;
                        case 4:
                          //Download More Quran Apps
                          downloadMoreApp(context);
                          break;
                        case 5:
                          //Rate App
                          launchURL(context,
                              url: isAndroid ? playStoreLink : appleStoreLink);
                          break;
                        default:
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
