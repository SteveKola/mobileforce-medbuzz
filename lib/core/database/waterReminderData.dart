import 'package:MedBuzz/core/models/water_reminder_model/water_reminder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WaterReminderData extends ChangeNotifier {
  static const String _boxName = "waterReminderBox";

  List<WaterReminder> _waterReminders = [];

  WaterReminder _activeWaterReminder;

  void getWaterReminders() async {
    var box = await Hive.openBox<WaterReminder>(_boxName);

    _waterReminders = box.values.toList();

    notifyListeners();
  }

  WaterReminder getWaterReminder(index){
    return _waterReminders[index];
  }

  void addWaterReminder(WaterReminder waterReminder) async {
    var box = await Hive.openBox<WaterReminder>(_boxName);

    await box.add(waterReminder);

    _waterReminders = box.values.toList();

    notifyListeners();
  }

  void deleteWaterReminder(key) async {
    var box = await Hive.openBox<WaterReminder>(_boxName);

    _waterReminders = box.values.toList();

    notifyListeners();
  }

  void editWaterReminder({WaterReminder waterReminder, int waterReminderKey}) async {
    var box = await Hive.openBox<WaterReminder>(_boxName);

    await box.put(waterReminderKey, waterReminder);

    _waterReminders = box.values.toList();

    _activeWaterReminder = box.get(waterReminderKey);

    notifyListeners();
  }

  void setActiveWaterReminder(key) async {
    var box = await Hive.openBox<WaterReminder>(_boxName);

    _activeWaterReminder = box.get(key);

    notifyListeners();
  }

  WaterReminder getActiveAppointment(){
    return _activeWaterReminder;
  }

  int get waterRemindersCount{
    return _waterReminders.length;
  }

}