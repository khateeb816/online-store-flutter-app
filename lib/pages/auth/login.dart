import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome\nBack!",
              style: TextStyle(
                fontSize: 36,
                fontFamily: "Montserrat-ExtraBold",
              ),
              textAlign: TextAlign.start,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                prefixIcon: Icon(Icons.person),
                hintText: "Username or Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
