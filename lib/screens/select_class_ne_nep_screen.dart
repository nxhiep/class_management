import 'package:class_management/components/select_class_widget.dart';
import 'package:class_management/screens/ne_nep_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SelectClassNeNepScreen extends StatefulWidget {
  const SelectClassNeNepScreen({ Key? key }) : super(key: key);

  @override
  State<SelectClassNeNepScreen> createState() => _SelectClassNeNepScreenState();
}

class _SelectClassNeNepScreenState extends State<SelectClassNeNepScreen> {

  void _onNextScreen(String classId) async {
    if(classId.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        title: "Chọn lớp!",
      ));
      return;
    }
    Get.to(NeNepScreen(classId: classId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chọn lớp"),
      ),
      body: SafeArea(
        child: SelectClassWidget(onSelectedClass: _onNextScreen),
      )
    );
  }
}