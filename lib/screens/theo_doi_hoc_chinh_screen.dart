
import 'package:flutter/material.dart';

class TheoDoiHocChinhScreen extends StatefulWidget {
  const TheoDoiHocChinhScreen({ Key? key }) : super(key: key);

  @override
  State<TheoDoiHocChinhScreen> createState() => _TheoDoiHocChinhScreenState();
}

class _TheoDoiHocChinhScreenState extends State<TheoDoiHocChinhScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theo dõi học chính"),
      ),
      body: const SafeArea(
        child: Center(child: Text("Theo dõi học chính")),
      )
    );
  }
}