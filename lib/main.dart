import 'package:flutter/material.dart';

//https://dribbble.com/shots/11424144-Flight-and-Hotel-Booking-App/attachments/3039736?mode=media
//https://www.flutter-study.dev/create-ui/flight-booking

//方針：ヘッダー（フライト情報）＋　チケット一覧の構成でつくる
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Fight Book',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: ,
        ),
      ),
    );
  }
}