import 'package:class_management/components/button.dart';
import 'package:class_management/repositories/data_management.dart';
import 'package:class_management/screens/home_screen.dart';
import 'package:class_management/screens/select_month_screen.dart';
import 'package:class_management/utils/constraint.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectYearScreen extends StatefulWidget {
  const SelectYearScreen({ Key? key }) : super(key: key);

  @override
  State<SelectYearScreen> createState() => _SelectYearScreenState();
}

class _SelectYearScreenState extends State<SelectYearScreen> {

  final int currentYear = DateTime.now().year;
  int year = 0;
  @override
  void initState() {
    super.initState();
    year = currentYear;
  }

  void _onNextScreen() async {
    DataManagement.currentYear = year;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(Constraint.keySelectYear, year);
    int? month = _prefs.getInt(Constraint.keySelectMonth);
    if(month == null) {
      Get.to(const SelectMonthScreen());
    } else {
      Get.offAll(const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chọn năm học"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(10, (index) {
                      int value = currentYear + index;
                      bool active = year == value;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            year = value;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: active ? Colors.blue : Colors.white,
                            border: Border.all(color: Colors.blue, width: 1)
                          ),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(value.toString(), style: TextStyle(color: active ? Colors.white : Colors.blue, fontWeight: FontWeight.bold))
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Button(
                  title: "Chọn", 
                  onPressed: _onNextScreen
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}