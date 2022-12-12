import 'package:class_management/components/button.dart';
import 'package:class_management/repositories/data_management.dart';
import 'package:class_management/screens/kiem_tra_dot_xuat_screen.dart';
import 'package:class_management/screens/select_class_di_muon_screen%20copy.dart';
import 'package:class_management/screens/select_class_ne_nep_screen.dart';
import 'package:class_management/screens/select_month_screen.dart';
import 'package:class_management/screens/select_year_screen.dart';
import 'package:class_management/screens/theo_doi_day_bu_screen.dart';
import 'package:class_management/screens/theo_doi_hoc_chieu_screen.dart';
import 'package:class_management/screens/theo_doi_hoc_chinh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextStyle _bottomAppBarTextStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DataManagement.schoolName),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: _makeBottomAppBar(), 
        ),
      ),
      body: _makeContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        }, 
        label: const Text("Tổng hợp nề nếp")
      ),
    );
  }

  Widget _makeBottomAppBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.indigo,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Text("Tháng ${DataManagement.currentMonth}", style: _bottomAppBarTextStyle),
            onTap: () {
              Get.to(const SelectMonthScreen());
            },
          ),
          const Text(" "),
          InkWell(
            child: Text("Năm học ${DataManagement.currentYear}", style: _bottomAppBarTextStyle),
            onTap: () {
              Get.to(const SelectYearScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _makeContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Button(
                title: "Theo dõi học chính",
                onPressed: () {
                  Get.to(const TheoDoiHocChinhScreen());
                }
              ),
              Button(
                title: "Theo dõi học thêm",
                onPressed: () {
                  Get.to(const TheoDoiHocChieuScreen());
                }
              ),
              Button(
                title: "Theo dõi dạy bù",
                onPressed: () {
                  Get.to(const TheoDoiDayBuScreen());
                }
              ),
              Button(
                title: "Kiểm tra đi muộn",
                onPressed: () {
                  Get.to(const SelectClassDiMuonScreen());
                }
              ),
              Button(
                title: "Kiểm tra vi phạm nền nếp",
                onPressed: () {
                  Get.to(const SelectClassNeNepScreen());
                }
              ),
              Button(
                title: "Kiểm tra đột xuất lần 1",
                onPressed: () {
                  Get.to(const KiemTraDotXuatScreen(
                    numberOfMonth: 1,
                  ));
                }
              ),
              Button(
                title: "Kiểm tra đột xuất lần 2",
                onPressed: () {
                  Get.to(const KiemTraDotXuatScreen(
                    numberOfMonth: 2,
                  ));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}