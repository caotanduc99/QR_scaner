import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanqr_code/model/phieu_xuat_model.dart';
import 'package:scanqr_code/views/phieuxuat_noibo_detail.dart';

class phieuxuat_noidbo extends StatefulWidget {


  @override
  _phieuxuat_noidboState createState() => _phieuxuat_noidboState();
}

class _phieuxuat_noidboState extends State<phieuxuat_noidbo> {

  String _scanBarcode = 'Unknown';
  List<String> _data = [];
  String _maThanhPham = "";
  String _hanSuDung = "";
  String _soLo = "";
  String _soKe = "";

  List<PhieuXuatModels> sampleData = [
    new PhieuXuatModels(
        tenphieu: "Phiếu 1",
        maThanhPham: "123456",
        hanSuDung: "15/05/2021",
        soLo: "15",
        soKe: "03",
        scanned: false
    ),
    new PhieuXuatModels(
        tenphieu: "Phiếu 2",
        maThanhPham: "123457",
        hanSuDung: "12/05/2021",
        soLo: "15",
        soKe: "05",
        scanned: false
    ),
    new PhieuXuatModels(
        tenphieu: "Phiếu 3",
        maThanhPham: "123458",
        hanSuDung: "20/05/2021",
        soLo: "13",
        soKe: "15",
        scanned: false
    ),
  ];

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Erorr';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });

    _data = _scanBarcode.split("|");
    setState(() {
      _maThanhPham = _data[0];
      _hanSuDung = _data[1];
      _soLo = _data[2];
      _soKe = _data[3];
    });

  }

  bool isExistCode(int index) {
    // bool done = true;
    // for(int i = 0; i < sampleData.length; i++) {
    //   if(sampleData[i].scanned == false) {
    //     done = false;
    //     break;
    //   }              check pass hết thì thoát ra
    // }
    //
    // if(done == true) Navigator.of(context).pop();

    if((sampleData[index].maThanhPham == _maThanhPham && sampleData[index].hanSuDung == _hanSuDung&&
        sampleData[index].soLo == _soLo &&
        sampleData[index].soKe == _soKe )|| sampleData[index].scanned == true) {
      if(sampleData[index].scanned == false) {
        sampleData[index].scanned = true;
      }
      return true;
    }
    return false;
  }

  @override
  void initState() {
    scanQR();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Phiếu xuất nội bộ kho", style: TextStyle(
              color: (Colors.white), fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: (){
                scanQR();
              },
              child: Icon(Icons.scanner),
            )
          ],
          //backgroundColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(234, 237, 237, 0.8),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: sampleData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:(route)=>PhieuXuatDetailPage(phieuXuatModels: sampleData[index],)
                            )
                        );
                        print('Tapped ${index}');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: isExistCode(index) == true
                                  ? Colors.green
                                  : Colors.white,
                              width: 2
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${sampleData[index].tenphieu}")
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}

Widget listItem(String title, BuildContext context) {
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
            // image: DecorationImage(
            //   image: AssetImage(image),
            //   fit: BoxFit.cover,
            // ),
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
        ),
      ],
    ),
  );
}