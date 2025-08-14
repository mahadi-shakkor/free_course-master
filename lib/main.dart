import 'package:flutter/material.dart';
import 'package:free_course/log_in_page.dart';
import 'package:free_course/screen/category_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CategoryScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 100,

                    decoration: BoxDecoration(


                      image: DecorationImage(
                        image: AssetImage("assets/images/woman_pic.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Red Dress",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "500",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10, height: 20);
          },
        ),
      ),
    );
  }
}
