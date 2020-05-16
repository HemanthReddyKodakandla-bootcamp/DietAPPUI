import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietPage extends StatefulWidget {
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height * 0.36,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.0)),
                  child: Container(
                    height: 60,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                top: height * 0.38,
                left: 0,
                right: 0,
                child: Container(
                  height: height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text("Meals for Today",
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 16.0,),
                                dietCardWidget(image: "assets/fruit_granola.jpg"),
                                dietCardWidget(image: "assets/pesto_pasta.jpg"),
                                dietCardWidget(image: "assets/keto_snack.jpg")
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            color: Colors.blue
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget dietCardWidget({String image}){
    return Container(
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          mainAxisSize:MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    child: Image.asset(
                      image,
                      width: 150,
                      fit: BoxFit.fill,)),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("diet"),
                      Text("time"),
                      Text("value"),
                    ],
                  ),
                ),
              )
            ],
        ),
    );
  }
}
