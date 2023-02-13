import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_concept_delivery_app/animation/fade_animation.dart';
import 'package:flutter_ui_concept_delivery_app/widgets/make_item.dart';

import '../widgets/make_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 5, 3, 0),
          size: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey[800],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket_outlined,
              color: Colors.grey[800],
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      'Que souhaitez-vous manger ?',
                      style: TextStyle(
                          color: Colors.grey[80],
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FadeAnimation(
                            1, makeCategory(isActive: true, title: 'Pizaa')),
                        FadeAnimation(1.3,
                            makeCategory(isActive: false, title: 'Burgers')),
                        FadeAnimation(
                            1.4, makeCategory(isActive: false, title: 'Kebab')),
                        FadeAnimation(1.5,
                            makeCategory(isActive: false, title: 'Desert')),
                        FadeAnimation(
                            1.6, makeCategory(isActive: false, title: 'Salad')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FadeAnimation(
                1,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Livaison sans frais',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(
                        1.4, makeItem(image: 'assets/images/one.jpg')),
                    FadeAnimation(
                        1.5, makeItem(image: 'assets/images/two.jpg')),
                    FadeAnimation(
                        1.6, makeItem(image: 'assets/images/three.jpg')),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
