import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_training_4/main.dart';

class SearchResults extends StatelessWidget{
  final String departure;
  final String shortDeparture;
  final String destination;
  final String shortDestination;

  SearchResults({
    this.departure,
    this.shortDeparture,
    this.destination,
    this.shortDestination
  }):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SearchedInfo(),
          ResultsIndex()
        ],
      ),
    );
  }
}

class SearchedInfo extends StatelessWidget{
  final String departure;
  final String shortDeparture;
  final String destination;
  final String shortDestination;

  SearchedInfo({
    this.departure,
    this.shortDeparture,
    this.destination,
    this.shortDestination
  }):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [BoxShadow(
            offset: Offset(0,0),
            blurRadius: 50,
            color: primaryColor
        )],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex:1,child: _AirportName(shortName: 'HND', fullName: 'Tokyo', align: Alignment.centerLeft,)),
              Expanded(flex:1,child: _FlightIcon()),
              Expanded(flex:1,child: _AirportName(shortName: 'JFK', fullName: 'NewYork',align: Alignment.centerRight,)),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Monday, 18 May, 2021',
              style: TextStyle(color: Colors.white54),
            ),
          )
        ],
      ),
    );
  }
}

class _AirportName extends StatelessWidget {
  final String shortName;
  final String fullName;
  final Alignment align;
  const _AirportName({
    Key key,
    @required this.shortName,
    @required this.fullName,
    @required this.align
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shortName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Text(
            fullName,
            style: TextStyle(
              color: kColorFlightText.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}


class _FlightIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(
            color: kColorFlightIcon,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(52 / 2),
        ),
        child: Transform.rotate(
          angle: pi/2,
          child: Icon(
            Icons.flight,
            color: kColorFlightIcon,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class ResultsIndex extends StatelessWidget{

  final List<Map> ticketData = [
    {'img':kSingaporeLogoUrl},
    {'img':kQantasLogoUrl},
    {'img':kEmiratesLogoUrl},
    {'img':kHainanLogoUrl}
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tickets',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kColorTextDark
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.filter_alt_sharp,
                      color: kColorText,
                    ),
                    onPressed: (){}
                    )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: ticketData.map((item){
                    return Column(
                      children: <Widget>[
                        Ticket(image: Image.network(item['img'])),
                        SizedBox(height: 8,)
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//ShapeBorder or CustomPaint で描画する
class Ticket extends StatelessWidget{
  final Widget image;
  const Ticket({
    @required this.image,
  }) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 128,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: TicketShapeBorder(width: 1,radius: 16.0)
      ),
      child: Row(
        children: <Widget>[
          /*画像*/
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(24),
              child: Center(child: image),
            ),
          ),
          /*ボーダーライン*/
          Container(
            width: 1,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            color: kColorTicketBorder,
          ),
          /*チケットデータ*/
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Departure',
                            style: TextStyle(color: kColorText, fontSize: 12),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '04:25 pm',
                            style: TextStyle(
                              color: kColorTextDark,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Arrive',
                            style: TextStyle(color: kColorText, fontSize: 12),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '07:55 pm',
                            style: TextStyle(
                                color: kColorTextDark,
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                    ],
                  ),
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimation',
                            style: TextStyle(color: kColorText, fontSize: 12),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '4h, 30m',
                            style: TextStyle(
                                color: kColorTextDark,
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$250.00',
                            style: TextStyle(
                              color: kColorPrimary,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '/person',
                            style: TextStyle(color: kColorText, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class TicketShapeBorder extends ShapeBorder{
  final double width;
  final double radius;
  TicketShapeBorder({
    @required this.width,
    @required this.radius,
  });
  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(width);
  }
  @override
  ShapeBorder scale(double t) {
    return TicketShapeBorder(
      width: width * t,
      radius: radius * t,
    );
  }
  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is TicketShapeBorder)
      return TicketShapeBorder(
        width: lerpDouble(a.width, width, t),
        radius: lerpDouble(a.radius, radius, t),
      );
    return super.lerpFrom(a, t);
  }
  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is TicketShapeBorder)
      return TicketShapeBorder(
        width: lerpDouble(width, b.width, t),
        radius: lerpDouble(radius, b.radius, t),
      );
    return super.lerpTo(b, t);
  }
  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(
      rect.deflate(width),
      textDirection: textDirection,
    );
  }
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final r = radius;
    final rs = radius / 2; // 区切り部分の半径
    final w = rect.size.width; // 全体の横幅
    final h = rect.size.height; // 全体の縦幅
    final wl = w / 3; // ロゴ部分の横幅
    return Path()
      ..addPath(
        Path()
          ..moveTo(r, 0)
          ..lineTo(wl - rs, 0) // →
          ..arcToPoint(
            Offset(wl + rs, 0),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(w - r, 0) // →
          ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
          ..lineTo(w, h - rs) // ↓
          ..arcToPoint(Offset(w - r, h), radius: Radius.circular(r))
          ..lineTo(wl + rs, h) // ←
          ..arcToPoint(
            Offset(wl - rs, h),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(r, h) // ←
          ..arcToPoint(Offset(0, h - r), radius: Radius.circular(r))
          ..lineTo(0, r) // ↑
          ..arcToPoint(Offset(r, 0), radius: Radius.circular(r)),
        Offset(rect.left, rect.top),
      );
  }
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = kColorTicketBorder;
    canvas.drawPath(
      getOuterPath(
        rect.deflate(width / 2.0),
        textDirection: textDirection,
      ),
      paint,
    );
  }
}