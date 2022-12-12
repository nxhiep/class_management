
import 'package:flutter/material.dart';

class TheoDoiDayBuScreen extends StatefulWidget {

  const TheoDoiDayBuScreen({ Key? key }) : super(key: key);

  @override
  State<TheoDoiDayBuScreen> createState() => _TheoDoiDayBuScreenState();
}

class _TheoDoiDayBuScreenState extends State<TheoDoiDayBuScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theo dõi dạy bù"),
      ),
      body: const SafeArea(
        child: Center(child: Text("Theo dõi dạy bù")),
      )
    );
  }
}