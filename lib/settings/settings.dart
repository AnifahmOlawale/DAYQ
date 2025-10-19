import 'package:disable_battery_optimizations_latest/disable_battery_optimizations_latest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/settings/about_app_setting/about_app.dart';
import 'package:quran_app/settings/download_translation/download_trans_sheet.dart';
import 'package:quran_app/settings/set_font/change_quran_font.dart';
import 'package:quran_app/settings/set_font_size/set_font_size.dart';
import 'package:quran_app/util/app_info.dart';
import 'package:quran_app/util/appbar_system_style.dart';
import 'package:quran_app/util/battery_optimization_dialog.dart';
import 'package:quran_app/util/hive_box.dart';
import 'package:quran_app/util/local_notification_service.dart';
import 'package:quran_app/util/value_notifier.dart';
import 'package:quran_app/widget_tree/listwidget.dart';
import 'package:quran_app/settings/contact_dev/contact_dev.dart';
import 'package:quran_app/provider/theme_color_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColorProvider = Provider.of<ThemeColor>(context);

    final List<String> settingsListTitle = [
      "Change Qur'an Font",
      "Change Qur'an Font Size",
      "Download Qur'an Translations",
      "About Application",
      "Developed By NajmaTech",
      "Enable Daily Hijri Notification"
    ];
    final List<Icon?> settingsListIcons = [
      Icon(Icons.text_format_rounded),
      Icon(Icons.format_size_rounded),
      Icon(Icons.translate_rounded),
      Icon(Icons.info),
      Icon(Icons.contact_support),
      null
    ];
    final List<Widget?> settingsListTrailing = [
      null,
      null,
      null,
      null,
      null,
      ValueListenableBuilder(
        valueListenable: hijriToggel,
        builder: (context, hijriToggelValue, child) => Switch.adaptive(
          value: hijriToggelValue,
          onChanged: (value) async {
            //  Create service instance
            final notificationService = LocalNotificationService();
            //  Check if battery optimization is disabled

            if (isAndroid) {
              bool? isBatteryDisabled = await DisableBatteryOptimizationLatest
                      .isBatteryOptimizationDisabled ??
                  true;

              if (!isBatteryDisabled) {
                // Show dialog to disable battery optimization
                if (!context.mounted) return;
                BatteryOptimizationDialog.show(context);
              }
              //

              if (isBatteryDisabled) {
                settings.put("hijriToggelValue", value);
                hijriToggel.value = !hijriToggel.value;
              }

              if (isBatteryDisabled && value) {
                //Reschedule Hijri + Reminder notifications
                await notificationService.renewDailyHijriNotification();
              } else if (!value) {
                // Cancel all notifications
                await notificationService.cancelAllNotifications();
              }
            }
          },
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: themeColorProvider.background,
      appBar: AppBar(
        backgroundColor: themeColorProvider.primary,
        foregroundColor: Colors.white,
        title: Text("Settings"),
        systemOverlayStyle: AppbarSystemStyle().appbarSystemStyle(context),
      ),
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            radius: Radius.circular(100),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: settingsListTitle.length,
                    itemBuilder: (context, index) {
                      return settingsListTile(
                        context,
                        title: settingsListTitle.elementAt(index),
                        icon: settingsListIcons.elementAt(index),
                        trailing: settingsListTrailing.elementAt(index),
                        onCardClick: () {
                          switch (index) {
                            case 0:
                              //Change Font
                              setFont(context);
                              break;
                            case 1:
                              //Change Font Size
                              setFontSize(context);
                              break;
                            case 2:
                              //Download Translations
                              downloadTransSheet(context);
                              break;
                            case 3:
                              //About App
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AboutApp()));
                              break;
                            case 4:

                              //Contact Developer
                              contactSheet(context);
                              break;
                            default:
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
