import 'package:flutter/material.dart';
import 'package:scanqr_code/model/phieu_nhap_model.dart';

class PhieuNhapDetailPage extends StatefulWidget{
  PhieuNhapDetailPage({required this.phieuNhapModels});
  final PhieuNhapModels phieuNhapModels;
  @override
  _PhieuNhapDetailState createState ()=> _PhieuNhapDetailState();
}

class _PhieuNhapDetailState extends State<PhieuNhapDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết phiếu nhập nội bộ", style: TextStyle(
            color: (Colors.white), fontWeight: FontWeight.bold),),
        centerTitle: true,
        //backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      body: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.code, color: Colors.green,),
                      labelText: 'Mã thành phẩm'),
                  initialValue: widget.phieuNhapModels.maThanhPham,
                  readOnly: true,
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.date_range, color: Colors.green,),
                      labelText: 'Hạn dùng'),
                  initialValue: widget.phieuNhapModels.hanSuDung,
                  readOnly: true,
                ),
              ),
              Container(

                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.backpack_outlined, color: Colors.green,),
                      labelText: 'Số lô'),
                  initialValue: widget.phieuNhapModels.soLo,
                  readOnly: true,
                ),
              ),


              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Số kệ'),
                  initialValue: widget.phieuNhapModels.soKe,
                  readOnly: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



