import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_training_4/main.dart';
import 'package:ui_training_4/home_model.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_)=>HomeModel(),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(
            blurRadius: 50,
          )],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFDADADA)],
            stops: [0,1],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                        style: TextStyle(color: kColorTextDark, fontSize: 30),
                        children:[
                          TextSpan(text:'Hi '),
                          TextSpan(text:'Reiya!', style: TextStyle(fontWeight: FontWeight.bold))
                        ]
                    )),
                    SizedBox(height: 8),
                    Text(
                      'Let\'s discover a new adventure!',
                      style: TextStyle(
                        fontSize: 13,
                        color: kColorTextDark,
                        fontWeight: FontWeight.w200
                      ),
                    )
                  ],
                ),
                Container(
                  width: 50,height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network('https://avatars.githubusercontent.com/u/78993317?s=400&u=539b14447ca6390623b15636c6af501e3234e22e&v=4'),
                  )
                )
              ],
            ),
            SizedBox(height: 30),
            SearchConsole()
          ],
        ),
      ),
    );
  }
}

class SearchConsole extends StatelessWidget{
  final List<Widget> searchConsoleList = [FlightSearchConsole(),HotelSearchConsole()];
  final List<String> searchButtonList = ['Flight','Hotels'];

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.select((HomeModel value) => value.currentIndex);
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          children: searchButtonList.map((item) {
            int currentIndex = context.select((HomeModel value) => value.currentIndex);
            int index = searchButtonList.indexOf(item);
            return Row(
              children: [
                GestureDetector(
                    onTap: (){
                      context.read<HomeModel>().changeIndex(index);
                    },
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 17,
                        color: (index == currentIndex)?kColorTextDark:Colors.grey
                      ),
                    )
                ),
                SizedBox(width: 20)
              ],
            );
          }).toList(),
        ),
        SizedBox(height:20),
        searchConsoleList[currentIndex]
      ],
    );
  }

}

class FlightSearchConsole extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: kColorTicketBorder),
              color: Colors.white
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.place, color: Colors.grey,),
                    Text('Tokyo'),
                    Text('HND')
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(height: 2, width: 100, color: kColorTicketBorder,),
                    Icon(Icons.compare_arrows)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.place ,color: Colors.grey,),
                    Text('NewYork'),
                    Text('JFK')
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

class HotelSearchConsole extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      color: Colors.grey,
    );
  }
}


class Saved extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('saved'),
    );
  }
}

class Alerts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('alerts'),
    );
  }
}

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('profile'),
    );
  }
}