import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Width of the page
    double w = MediaQuery.of(context).size.width;
    //Height of the page
    double h = MediaQuery.of(context).size.height;

    //Main UI
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image Part
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/parking2.png"),
                fit: BoxFit.contain,
              )),
            ),

            // Text Part
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  //Input 1
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Input 2
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            //Space
            SizedBox(
              height: 50,
            ),

            //Button Sign In
            Container(
              width: w * 0.5,
              height: h * 0.1,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //Space
            SizedBox(
              height: 30,
            ),

            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),

            //Space
            SizedBox(
              height: w * 0.2,
            ),
            //End

            // RichText(
            //     text: TextSpan(
            //   text: "Sign up using one of the following method",
            //   style: TextStyle(color: Colors.black, fontSize: 16),
            // )),

            //Showing widgets
            //   Wrap(
            //     children: List<Widget>.generate(
            //       3,
            //       (index){
            //         return CircleAvatar(
            //         );
            //       },
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
