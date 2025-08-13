import 'package:flutter/material.dart';
import 'package:free_course/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 240,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/design.png"),
                // fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                // fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Welcome Back!",
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Log in to existing LOGO account",
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Color(0xFF515151),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: "User Name",
            icons: Icons.person_2_outlined,
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: "Password",
            icons: Icons.lock,
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.
              symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Color(0xFF515151),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(20),
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff8EDDFF),
                Color(0xFF769DAD),

              ]),

            ),
            child:  Center(
              child: Text(
                "Log In",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/facebook.png"))
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/facebook.png"))
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/facebook.png"))
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
