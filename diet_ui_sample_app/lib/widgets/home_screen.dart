import 'package:dietuisampleapp/model/meal.dart';
import 'package:dietuisampleapp/widgets/workout_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:animations/animations.dart';

import 'meal_details_view.dart';

class DietPage extends StatefulWidget {
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    DateTime date = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
            iconSize: 40,
            selectedIconTheme: IconThemeData(
              color: const Color(0xFF200087),
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.home),
                ),
                title: Text(
                  "Home",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  child: Icon(Icons.search),
                  padding: const EdgeInsets.only(top: 8.0),
                ),
                title: Text(
                  "Search",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  child: Icon(Icons.person),
                  padding: const EdgeInsets.only(top: 8.0),
                ),
                title: Text(
                  "Profile",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height * 0.34,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.0)),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8.0,),
                        ListTile(
                          title: Text("${DateFormat('EEEE, d MMMM').format(date).toString()}"),
                          subtitle: Text("Hello, David",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,color: Colors.black),),
                          trailing: ClipOval(
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              color: Colors.grey[200],
                                child: Icon(Icons.person,size: 32.0,)),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          margin: EdgeInsets.only(left: 24.0,right: 24.0),
                          child: Row(
                            children: <Widget>[
                              _RadialProgress(
                                width: width * 0.4,
                                height: width * 0.4,
                                progress: 0.75,
                              ),
                              SizedBox(width: 10.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _IngredientProgress(
                                    ingredient: "Protein",
                                    progress: 0.3,
                                    progressColor: Colors.green,
                                    leftAmount: 72,
                                    width: width * 0.28,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _IngredientProgress(
                                    ingredient: "Carbs",
                                    progress: 0.2,
                                    progressColor: Colors.red,
                                    leftAmount: 252,
                                    width: width * 0.28,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _IngredientProgress(
                                    ingredient: "Fat",
                                    progress: 0.1,
                                    progressColor: Colors.yellow,
                                    leftAmount: 61,
                                    width: width * 0.28,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
        Positioned(
          top: height * 0.38,
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 32,
                    right: 16,
                  ),
                  child: Text(
                    "MEALS FOR TODAY",
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 32,
                        ),
                        for (int i = 0; i < meals.length; i++)
                          MealDetailViewCard(
                            meal: meals[i],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: OpenContainer(
                    closedElevation: 0,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 600),
                    closedColor: const Color(0xFFE9E9E9),
                    openBuilder: (context, _) {
                      return WorkoutScreen();
                    },
                    closedBuilder: (context, VoidCallback openContainer) {
                      return GestureDetector(
                        onTap: openContainer,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF20008B),
                                const Color(0xFF200087),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, left: 16),
                                child: Text(
                                  "YOUR NEXT WORKOUT",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 16),
                                child: Text(
                                  "Upper Body",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        color: const Color(0xFF5B4D9D),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/chest.png",
                                        width: 50,
                                        height: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        color: const Color(0xFF5B4D9D),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/back.png",
                                        width: 50,
                                        height: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        color: const Color(0xFF5B4D9D),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/biceps.png",
                                        width: 50,
                                        height: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}

class MealDetailViewCard extends StatelessWidget {
  final Meal meal;

  const MealDetailViewCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 600),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress({Key key, this.ingredient, this.leftAmount, this.progress, this.progressColor, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.7,
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
