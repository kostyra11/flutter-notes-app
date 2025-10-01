import 'package:flutter/services.dart';

class DeviceInfo {
  static final DeviceInfo _instance = DeviceInfo._internal();

  DeviceInfo._internal();

  static DeviceInfo get instance => _instance;

  final _channel = MethodChannel('com.example.flutter_notes_app');

  Future<dynamic> getBatteryLevel() async {
    dynamic batteryLevel = '';
    try {
      batteryLevel = await _channel.invokeMethod('getBatteryLevel');

      if (batteryLevel != null) {
        return batteryLevel;
      }
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return '';
  }
}
