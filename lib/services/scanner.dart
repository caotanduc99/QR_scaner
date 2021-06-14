import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  String _scanBarcode = 'Unknown';
  String _maThanhPham = "";
  String _hanSuDung = "";
  String _soLo = "";
  String _soKe = "";

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Lỗi phiên bản.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });

    if(_scanBarcode != "Unknown") {
      List<String> temp = _scanBarcode.split("|");
      setState(() {
        _maThanhPham = temp[0];
        _hanSuDung = temp[1];
        _soLo = temp[2];
        _soKe = temp[3];
      });
    }

  }

  @override
  void initState() {
    scanQR();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Quét QR')),
        body: Container(
            alignment: Alignment.center,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ElevatedButton(
                  //     onPressed: () => scanQR(),
                  //     child: Text('Start QR scan')
                  // ),
                  Text('Mã thành phẩm: $_maThanhPham\n'
                      'Hạn dùng: $_hanSuDung\n'
                      'Số lô: $_soLo\n'
                      'Số kệ: $_soKe\n',
                      style: TextStyle(fontSize: 20))
                ]))
    );
  }
}