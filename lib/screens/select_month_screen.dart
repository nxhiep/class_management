import 'package:class_management/components/button.dart';
import 'package:class_management/repositories/data_management.dart';
import 'package:class_management/screens/home_screen.dart';
import 'package:class_management/utils/constraint.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectMonthScreen extends StatefulWidget {
  const SelectMonthScreen({ Key? key }) : super(key: key);

  @override
  State<SelectMonthScreen> createState() => _SelectMonthScreenState();
}

class _SelectMonthScreenState extends State<SelectMonthScreen> {
  final int currentMonth = DateTime.now().month;
  int month = 0;
  @override
  void initState() {
    super.initState();
    month = currentMonth;
  }

  void _onNextScreen() async {
    DataManagement.currentMonth = month;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(Constraint.keySelectMonth, month);
    Get.offAll(const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chọn tháng"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((value) {
                      bool active = month == value;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            month = value;
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
                          child: Text("Tháng " + value.toString(), style: TextStyle(color: active ? Colors.white : Colors.blue, fontWeight: FontWeight.bold))
                        ),
                      );
                    }).toList(),
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