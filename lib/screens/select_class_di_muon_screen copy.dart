import 'package:class_management/components/select_class_widget.dart';
import 'package:class_management/screens/kiem_tra_di_muon_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SelectClassDiMuonScreen extends StatefulWidget {
  const SelectClassDiMuonScreen({ Key? key }) : super(key: key);

  @override
  State<SelectClassDiMuonScreen> createState() => _SelectClassDiMuonScreenState();
}

class _SelectClassDiMuonScreenState extends State<SelectClassDiMuonScreen> {

  void _onNextScreen(String classId) async {
    if(classId.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        title: "Chọn lớp!",
      ));
      return;
    }
    Get.to(KiemTraDiMuonScreen(classId: classId));
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