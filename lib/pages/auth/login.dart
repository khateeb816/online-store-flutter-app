import 'package:flutter/material.dart';
import 'package:online_store/pages/auth/register.dart';
import 'package:online_store/pages/forget_password/index.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
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
            SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAE7E7),
                prefixIcon: Icon(Icons.person),
                hintStyle: TextStyle(fontSize: 13, color: Color(0xFF676767)),
                hintText: "Username or Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
              controller: passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEAE7E7),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: isPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 13, color: Color(0xFF676767)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                focusColor: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 194),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Color(0xFFF63758)),
                ),
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
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
            ),
            SizedBox(height: 70),
            Center(
              child: Text(
                "- OR Continue with -",
                style: TextStyle(fontSize: 12, color: Color(0xFF676767)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFAF1F4),
                    border: Border.all(color: Color(0xFFF63758), width: 1.5),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple, size: 40),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFAF1F4),
                    border: Border.all(color: Color(0xFFF63758), width: 1.5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFAF1F4),
                    border: Border.all(color: Color(0xFFF63758), width: 1.5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset('assets/images/facebook.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create An Account",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat-Regular",
                    color: Color(0xFF575757),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Montserrat-SemiBold",
                      color: Color(0xFFF63758),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFF63758),
                      decorationThickness: 1.8,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
