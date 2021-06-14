import 'package:flutter/material.dart';
import 'package:scanqr_code/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.green,
      ),
      home: HomePage(),
    );
  }
}
