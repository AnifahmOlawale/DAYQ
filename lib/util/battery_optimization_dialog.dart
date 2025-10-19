import 'package:flutter/material.dart';
import 'package:disable_battery_optimizations_latest/disable_battery_optimizations_latest.dart';

class BatteryOptimizationDialog {
  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Disable Battery Optimization"),
        content: const Text(
          "To ensure daily reminders work properly, please disable battery optimization for this app.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await DisableBatteryOptimizationLatest
                  .showDisableBatteryOptimizationSettings();
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }
}
