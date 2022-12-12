import 'package:class_management/components/button.dart';
import 'package:class_management/utils/config.dart';
import 'package:flutter/material.dart';

class SelectClassWidget extends StatefulWidget {

  final Function(String classId) onSelectedClass;
  const SelectClassWidget({ Key? key, required this.onSelectedClass }) : super(key: key);

  @override
  State<SelectClassWidget> createState() => _SelectClassWidgetState();
}

class _SelectClassWidgetState extends State<SelectClassWidget> {

  String classId = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: Config.classListIds.map((value) {
                  bool active = classId == value;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        classId = value;
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
                      child: Text("Lớp " + value.toString(), style: TextStyle(color: active ? Colors.white : Colors.blue, fontWeight: FontWeight.bold))
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
              onPressed: () => widget.onSelectedClass(classId)
            ),
          )
        ],
      ),
    );
  }
}