import 'package:flutter/material.dart';
import 'package:online_store/pages/auth/register.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot\npassword?",
              style: TextStyle(
                fontSize: 36,
                fontFamily: "Montserrat-ExtraBold",
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAE7E7),
                prefixIcon: Icon(Icons.person),
                hintStyle: TextStyle(fontSize: 13, color: Color(0xFF676767)),
                hintText: "Enter your email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFF63758),
                  fontFamily: "Montserrat-SemiBold",
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' We will send you a message to set or reset your new password',
                    style: TextStyle(
                      color: Color(0xFF676767),

                      fontFamily: "Montserrat-Regular",
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF63758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
