import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:random_number/theme/images.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.background), fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              GradientAppBar('Main Screen', 120),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose your game',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Categories(),
              )
            ],
          )),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight;

  GradientAppBar(this.title, this.barHeight);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
        padding: EdgeInsets.only(top: statusbarHeight),
        height: statusbarHeight + barHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.redAccent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: About(),
              ),
            )
          ],
        ));
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Images.number,
          Images.color,
          Images.animal,
          Images.vehicle,
          Images.fruit
        ].map((categories) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreenAccent, Colors.green],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.5, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: InkWell(
                    child: Image.asset(
                      categories,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      if(categories.contains(Images.number)){
                        print('Navigate To Number Game');
                      }
                      else if (categories.contains(Images.color)){
                        print('Navigate To Color Game');
                      }
                      else if (categories.contains(Images.animal)){
                        print('Navigate To Animal Game');
                      }
                      else if (categories.contains(Images.vehicle)){
                        print('Navigate To Vehicle Game');
                      }
                      else if (categories.contains(Images.fruit)){
                        print('Navigate To Fruit Game');
                      }
                    },
                  ));
            },
          );
        }).toList(),
        height: MediaQuery.of(context).size.height/3,
        autoPlay: false);
  }
}

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.error),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('About'),
                  content: Text('About and Report Bug')

                );
              });
        });
  }
}


