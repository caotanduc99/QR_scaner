import 'dart:async';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:scanqr_code/services/scanner.dart';
import 'package:scanqr_code/views/kiem_ke.dart';
import 'package:scanqr_code/views/phieunhap_dichuyen_noibo.dart';
import 'package:scanqr_code/views/phieuxuat_dichuyen_noibo.dart';
import 'package:scanqr_code/views/phieuxuat_kho.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<String> service = [
    "Phiếu nhập di chuyển nội bộ",
    "Phiếu xuất di chuyển nội bộ",
    "Phiếu xuất kho",
    "Kiểm kê",
    "Quét QR"
  ];

  List<Widget>body = [
    phieunhap_noidbo(),
    phieuxuat_noidbo(),
    phieuxuat_kho(),
    kiem_ke(),
    QR()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan Phiếu",style: TextStyle(color: (Colors.white),fontWeight: FontWeight.bold),),
          centerTitle: true,
          //backgroundColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(234, 237, 237, 1),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: service.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder:(route)=>body[index]
                                )
                            );
                            print('Tapped ${index}');
                          },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(service[index])
                            ],
                          ),
                        ),
                      );

                    },
                  ),
                )
              ],
            )
        )
    );
  }
}
//Thẻ
Widget listItem(String image, String title, BuildContext context) {
  return Container(

    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white
    ),
    child: Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),

        SizedBox(width: 10,),

        Container(
          width: MediaQuery.of(context).size.width - 120,
          child: Text(
            title,
            //Chỉnh style service
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green,
                fontFamily: 'Raleway'
            ),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    ),
  );
}
