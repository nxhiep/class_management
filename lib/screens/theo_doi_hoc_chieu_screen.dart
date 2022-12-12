
import 'package:flutter/material.dart';

class TheoDoiHocChieuScreen extends StatefulWidget {
  const TheoDoiHocChieuScreen({ Key? key }) : super(key: key);

  @override
  State<TheoDoiHocChieuScreen> createState() => _TheoDoiHocChieuScreenState();
}

class _TheoDoiHocChieuScreenState extends State<TheoDoiHocChieuScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theo dõi học thêm (chiều)"),
      ),
      body: const SafeArea(
        child: Center(child: Text("Theo dõi học thêm (chiều)")),
      )
    );
  }
}