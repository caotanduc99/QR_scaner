import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scanqr_code/model/phieu_kiemke_model.dart';

class PhieuKiemKeDetailPage extends StatefulWidget{
  PhieuKiemKeDetailPage({required this.phieuKiemKeModels});
  final PhieuKiemKeModels phieuKiemKeModels;
  @override
  _PhieuKiemKeDetailState createState ()=> _PhieuKiemKeDetailState();
}

class _PhieuKiemKeDetailState extends State<PhieuKiemKeDetailPage> {

  String? _matp='123457';
  String? _handung='15/05/2022';
  String? _solo='17';
  String? _soke='06';
  String? _tenTP='Thành phẩm 1';
  String? _DVT='bao';
  String? _slTonSoSach='50';
  String? _slThucTe='';



  // Future<void>toast()async{
  //   Fluttertoast.showToast(
  //       msg: "Đã thay đổi",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết phiếu kiểm kê", style: TextStyle(
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
                  initialValue: _matp,
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
                  initialValue: _handung,
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
                  initialValue: _solo,
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
                  initialValue: _soke,
                  readOnly: true,
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'dd/MM/yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event, color: Colors.green,),
                  dateLabelText: 'Ngày Kiểm',
                  onChanged: (val)=> print(val),
                  onSaved: (val) => print(val),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Số kho'),

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Tên nhân viên'),

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Tên thành phẩm'),
                  initialValue: _tenTP,

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'ĐVT'),
                  initialValue: _DVT,

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Số lượng tồn sổ sách'),
                  initialValue: _slTonSoSach,

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.fire_extinguisher, color: Colors.green,),
                      labelText: 'Số lượng tồn thực tế'),
                  initialValue: _slThucTe,

                ),
              ),


              Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[

                          SizedBox(width:20.0),
                          Text(
                            'Hoàn tất',
                            style: TextStyle(color: Colors.white,fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed:(){
                        Fluttertoast.showToast(
                            msg: "Đã thay đổi",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        print('done');
                        Navigator.of(context).pop();
                      }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}



