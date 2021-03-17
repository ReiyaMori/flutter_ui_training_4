import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_training_4/home.dart';
import 'package:ui_training_4/main_model.dart';

//https://dribbble.com/shots/11424144-Flight-and-Hotel-Booking-App/attachments/3039736?mode=media
//https://www.flutter-study.dev/create-ui/flight-booking

//方針：ヘッダー（フライト情報）＋　チケット一覧の構成でつくる
void main()=>runApp(new MyApp());

Color primaryColor = Color(0xFF2D8276);

const kColorPrimary = Color(0xFF2E8376);
const kColorText = Color(0xFF9E9E9E);
const kColorTextDark = Color(0xFF142D4A);
const kColorFlightText = Color(0xFFE0E0E0);
const kColorFlightIcon = Color(0xFFC1B695);
const kColorTicketBorder = Color(0xFFE0E0E0);

const kSingaporeLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220821-1ebc8880-995a-11ea-9d77-07edda64f05c.png';
const kQantasLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220824-1fedb580-995a-11ea-8124-f59daff4ebda.png';
const kEmiratesLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220816-1c5a2e80-995a-11ea-921d-38b3f991d8d2.png';
const kHainanLogoUrl = 'https://user-images.githubusercontent.com/7200238/82223309-73adce00-995d-11ea-98c0-2dba4e094aca.png';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Fight Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: ChangeNotifierProvider(
        create: (_)=>MainModel(),
        child: MyPage(),
      ),
    );
  }
}

class MyPage extends StatelessWidget{
  final List<Widget> pageList = [
    Home(),
    Saved(),
    Alerts(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.select((MainModel value) => value.currentIndex);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body:Stack(
        children: <Widget>[
          pageList[currentIndex],
          Align(alignment:Alignment.bottomCenter, child: CustomBottomNavigationBar())
        ],
      )
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget{
  final List<CustomBottomNavigationItem> barItem = [
    CustomBottomNavigationItem(icon: Icons.home, label: 'HOME'),
    CustomBottomNavigationItem(icon: Icons.bookmark, label: 'SAVED'),
    CustomBottomNavigationItem(icon: Icons.notifications, label: 'ALERTS'),
    CustomBottomNavigationItem(icon: Icons.person, label: 'PROFILE')
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),topRight: Radius.circular(30)
        )
      ),
      height: 100,
      padding: EdgeInsets.only(top: 20,bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItem.map((item) {
          int currentIndex = context.select((MainModel value) => value.currentIndex);
          int index = barItem.indexOf(item);
          return GestureDetector(
            onTap: (){
              context.read<MainModel>().chagePage(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  item.icon,
                  color: (index == currentIndex)?primaryColor:Colors.grey,
                  size: 30,
                ),
                Text(
                  item.label,
                  style: TextStyle(
                    color: (index == currentIndex)?primaryColor:Colors.grey,
                    fontSize: 8, fontWeight: FontWeight.w700
                  ),
                ),
                Container(
                  width: 4, height: 4,
                  decoration: BoxDecoration(
                    color: (index == currentIndex)?primaryColor:Colors.white,
                    borderRadius: BorderRadius.circular(2)
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  } 
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  
  CustomBottomNavigationItem(
      {@required this.icon, @required this.label});

}