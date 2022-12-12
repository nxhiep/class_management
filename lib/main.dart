
import 'package:class_management/repositories/data_management.dart';
import 'package:class_management/screens/home_screen.dart';
import 'package:class_management/screens/select_month_screen.dart';
import 'package:class_management/screens/select_year_screen.dart';
import 'package:class_management/utils/Constraint.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  int? year = _prefs.getInt(Constraint.keySelectYear);
  int? month = _prefs.getInt(Constraint.keySelectMonth);
  if(year == null) {
    runApp(const GetMaterialApp(home: SelectYearScreen()));
  } else if(month == null) {
    runApp(const GetMaterialApp(home: SelectMonthScreen()));
  } else {
    DataManagement.currentYear = year;
    DataManagement.currentMonth = month;
    runApp(const GetMaterialApp(home: HomeScreen()));
  }
}