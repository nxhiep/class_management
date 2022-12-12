import 'dart:ffi';

import 'package:class_management/utils/config.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class KiemTraDotXuatScreen extends StatefulWidget {

  final int numberOfMonth;

  const KiemTraDotXuatScreen({ Key? key, required this.numberOfMonth }) : super(key: key);

  @override
  State<KiemTraDotXuatScreen> createState() => _KiemTraDotXuatScreenState();
}

class _KiemTraDotXuatScreenState extends State<KiemTraDotXuatScreen> {

  DateTime time = DateTime.now();
  final TextEditingController _checkerEditingController = TextEditingController(text: "");
  final TextEditingController _noteEditingController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiểm tra đột xuất lần ${widget.numberOfMonth}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Ngày tháng: "),
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
                  const Text("Người kiểm tra: "),
                  Expanded(
                    child: TextField(
                      controller: _checkerEditingController,
                    ),
                  ),
                ],
              ),
              Text("Lần: ${widget.numberOfMonth}/tháng"),
              Expanded(
                child: MorningWidget(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tình hình thực hiện nề nếp"),
                  TextField(
                    controller: _noteEditingController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MorningWidget extends StatefulWidget {
  const MorningWidget({ Key? key }) : super(key: key);

  @override
  State<MorningWidget> createState() => _MorningWidgetState();
}

class _MorningWidgetState extends State<MorningWidget> {

  List<PlutoColumn> columns = [
    PlutoColumn(
      width: 80,
      title: 'Lớp',
      field: 'class_field',
      enableEditingMode: false,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Trang phục',
      field: 'trang_phuc_field',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Vệ sinh, cơ sở vật chất',
      field: 'vs_csvc_field',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Thái độ học tập',
      field: 'tdht_field',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Sinh hoạt tập thể',
      field: 'shtt_field',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Ghi chú',
      field: 'note_field',
      type: PlutoColumnType.text(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: columns,
      rows: Config.classListIds.map((classId) {
        return PlutoRow(
          cells: {
            'class_field': PlutoCell(value: classId),
            'trang_phuc_field': PlutoCell(value: 0),
            'vs_csvc_field': PlutoCell(value: 0),
            'tdht_field': PlutoCell(value: 0),
            'shtt_field': PlutoCell(value: 0),
            'note_field': PlutoCell(value: ''),
          }
        );
      }).toList(),
      onChanged: (PlutoGridOnChangedEvent event) {
        print(event);
      },
      onLoaded: (PlutoGridOnLoadedEvent event) {
        print(event);
      }
  );
  }
}

class AfternoonWidget extends StatefulWidget {
  const AfternoonWidget({ Key? key }) : super(key: key);

  @override
  State<AfternoonWidget> createState() => _AfternoonWidgetState();
}

class _AfternoonWidgetState extends State<AfternoonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}