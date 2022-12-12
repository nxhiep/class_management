import 'dart:async';

import 'package:class_management/components/button.dart';
import 'package:class_management/models/diem_kiem_tra_ne_nep.dart';
import 'package:class_management/repositories/data_management.dart';
import 'package:class_management/utils/utils.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeNepScreen extends StatefulWidget {
  final String classId;
  const NeNepScreen({ Key? key, required this.classId }) : super(key: key);

  @override
  State<NeNepScreen> createState() => _NeNepScreenState();
}

class _NeNepScreenState extends State<NeNepScreen> {

  List<DiemKiemTraNeNep> values = [];

  String get classId => widget.classId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiểm tra nề nếp lớp $classId"),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: SizedBox(width: 50)
                ),
                DataColumn(
                  label: Expanded(child: Text("Ngày tháng")),
                  tooltip: "Ngày tháng",
                ),
                DataColumn(
                  label: Expanded(child: Text("Họ tên")),
                  tooltip: "Họ tên",
                ),
                DataColumn(
                  label: Expanded(child: Text("Điểm trừ")),
                  tooltip: "Điểm trừ",
                ),
                DataColumn(
                  label: Expanded(child: Text("Nội dung vi phạm")),
                  tooltip: "Nội dung vi phạm",
                ),
                DataColumn(
                  label: Expanded(child: Text("Ghi chú")),
                  tooltip: "Ghi chú",
                ),
              ], 
              rows: values.map((value) {
                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: const Icon(Icons.edit), onPressed: () {
                            showDialogCreate(value).then((newValue) {
                              setState(() {
                                values.replaceRange(values.indexOf(value), 1, [newValue]);
                              });
                            });
                          }),
                          IconButton(icon: const Icon(Icons.delete), onPressed: () {
                            setState(() {
                              values.remove(value);
                            });
                            // TODO: update
                          })
                        ],
                      ),
                    ),
                    DataCell(
                      Text(Utils.formatDate(value.date)),
                    ),
                    DataCell(
                      Text(value.studentsName),
                    ),
                    DataCell(
                      Text(value.minusPoint.toString()),
                    ),
                    DataCell(
                      Text(value.content),
                    ),
                    DataCell(
                      Text(value.note),
                    ),
                  ]
                );
              }).toList()
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Thêm"),
        onPressed: () {
          setState(() {
            showDialogCreate(null).then((value) {
              setState(() {
                values.add(value);
              });
            });
          });
        }, 
      ),
    );
  }

  Future<DiemKiemTraNeNep> showDialogCreate(DiemKiemTraNeNep? item) {
    Completer<DiemKiemTraNeNep> completer = Completer();
    showDialog(
      context: context, 
      builder: (context) => CreateNeNepWidget(
        classId: classId,
        item: item,
        onChanged: (value) {
          completer.complete(value);
        }
      ),
    );
    return completer.future;
  }
}

class CreateNeNepWidget extends StatefulWidget {
  final String classId;
  final DiemKiemTraNeNep? item;
  final Function(DiemKiemTraNeNep value) onChanged;
  const CreateNeNepWidget({ Key? key, required this.onChanged, required this.classId, this.item }) : super(key: key);

  @override
  State<CreateNeNepWidget> createState() => _CreateNeNepWidgetState();
}

class _CreateNeNepWidgetState extends State<CreateNeNepWidget> {

  DateTime time = DateTime.now();
  int point = 1;
  late TextEditingController _nameEditController;
  late TextEditingController _contentEditController;
  late TextEditingController _noteEditController;

  @override
  void initState() {
    super.initState();
    _nameEditController = TextEditingController(text: widget.item?.studentsName);
    _contentEditController = TextEditingController(text: widget.item?.content);
    _noteEditController = TextEditingController(text: widget.item?.note);
    point = widget.item?.minusPoint ?? 1;
    int? _t = widget.item?.date;
    time = _t != null ? DateTime(_t) : DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.all(12),
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child:  Text("Thêm vi phạm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                  child: Text("Ngày tháng:")
                ),
                Expanded(
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: time,
                    initialValue: time.toString(),
                    onChanged: (value) {
                      setState(() {
                        time = DateTime.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                  child: Text("Học tên:"),
                ),
                Expanded(
                  child: TextField(
                    controller: _nameEditController,
                  ),
                ),
              ]
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                  child: Text("Điểm trừ:")
                ),
                DropdownButton<int>(
                  value: point,
                  items: List.generate(10, (index) => DropdownMenuItem(child: Text((index + 1).toString()), value: index + 1)),
                  onChanged: (value) {
                    setState(() {
                      point = value!;
                    });
                  }
                ),
              ]
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                  child: Text("Nội dung vi phạm:"),
                ),
                Expanded(
                  child: TextField(
                    controller: _contentEditController,
                    maxLines: 2,
                  ),
                ),
              ]
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                  child: Text("Ghi chú:")
                ),
                Expanded(
                  child: TextField(
                    controller: _noteEditController,
                    maxLines: 2,
                  ),
                ),
              ]
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Button(
                      backgroundColor: Colors.transparent,
                      title: "Huỷ", 
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Button(
                      title: "Lưu", 
                      onPressed: () {
                        widget.onChanged(getValue());
                        Navigator.pop(context);
                      }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DiemKiemTraNeNep getValue() {
    return DiemKiemTraNeNep(
      schoolName: DataManagement.schoolName,
      schoolYearId: DataManagement.currentYear.toString(),
      content: _contentEditController.text,
      note: _noteEditController.text,
      studentsName: _nameEditController.text,
      date: time.millisecondsSinceEpoch,
      minusPoint: point,
      classId: widget.classId
    );
  }
}