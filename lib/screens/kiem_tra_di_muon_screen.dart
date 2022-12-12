
import 'package:flutter/material.dart';

class KiemTraDiMuonScreen extends StatefulWidget {
  final String classId;
  const KiemTraDiMuonScreen({ Key? key, required this.classId }) : super(key: key);

  @override
  State<KiemTraDiMuonScreen> createState() => _KiemTraDiMuonScreenState();
}

class _KiemTraDiMuonScreenState extends State<KiemTraDiMuonScreen> {

  String get classId => widget.classId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiểm tra đi muộn lớp $classId"),
      ),
      body: const SafeArea(
        child: Center(child: Text("Kiểm tra đi muộn")),
      )
    );
  }
}