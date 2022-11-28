import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:flutter_quizapplication_1/guzelsanatlarlist.dart';
import 'package:flutter_quizapplication_1/settings.dart';

class MyCustomUI extends StatefulWidget {
  const MyCustomUI({Key? key}) : super(key: key);

  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edebiyat Quiz',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: _w / 35),
                    Text(
                      'AYT Edebiyat Bilgisi Konu Başlıkları',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              homePageCardsGroup(
                Color(0xfff37736),
                Icons.book_outlined,
                'Güzel Sanatlar ve Edebiyat',
                context,
                MyCustomWidget(),
                Color(0xffFF6D6D),
                Icons.all_inclusive,
                'Metinlerin Sınıflandırılması',
                RouteWhereYouGo(),
              ),
              homePageCardsGroup(
                  Colors.lightGreen,
                  Icons.gamepad_outlined,
                  'Şiir Bilgisi',
                  context,
                  RouteWhereYouGo(),
                  Color(0xffffa700),
                  Icons.article,
                  'Söz Sanatları',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xff63ace5),
                  Icons.ad_units_outlined,
                  'İslamiyet Öncesi Türk Edebiyatı',
                  context,
                  RouteWhereYouGo(),
                  Color(0xfff37736),
                  Icons.article_sharp,
                  'İslam Uygarlığı Çevresinde Gelişen Türk Edebiyatı',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xffFF6D6D),
                  Icons.android,
                  'Halk Edebiyatı',
                  context,
                  RouteWhereYouGo(),
                  Colors.lightGreen,
                  Icons.text_format,
                  'Divan Edebiyatı',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xffffa700),
                  Icons.text_fields,
                  'Edebiyat Akımları',
                  context,
                  RouteWhereYouGo(),
                  Color(0xff63ace5),
                  Icons.calendar_today_sharp,
                  'Tanzimat Edebiyatı',
                  RouteWhereYouGo()),
              SizedBox(height: _w / 20),
              homePageCardsGroup(
                  Color(0xffFF6D6D),
                  Icons.android,
                  'Batı Edebiyatı',
                  context,
                  RouteWhereYouGo(),
                  Colors.lightGreen,
                  Icons.text_format,
                  'Servet-i Fünun Edebiyatı',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xffffa700),
                  Icons.text_fields,
                  'Fecr-i Ati Edebiyatı',
                  context,
                  RouteWhereYouGo(),
                  Color(0xff63ace5),
                  Icons.calendar_today_sharp,
                  'Milli Edebiyat',
                  RouteWhereYouGo()),
              SizedBox(height: _w / 20),
              homePageCardsGroup(
                  Color(0xffFF6D6D),
                  Icons.android,
                  'Cumhuriyet Dönemi Türk Edebiyatı',
                  context,
                  RouteWhereYouGo(),
                  Colors.lightGreen,
                  Icons.text_format,
                  'Batı Edebiyatı',
                  RouteWhereYouGo()),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return settings();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: _w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
      Color color,
      IconData icon,
      String title,
      BuildContext context,
      Widget route,
      Color color2,
      IconData icon2,
      String title2,
      Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, route),
          homePageCard(color2, icon2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  const RouteWhereYouGo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
