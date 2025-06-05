import 'package:flutter/material.dart';
import 'package:online_store/pages/components/app_bar.dart';
import 'package:online_store/pages/components/bottom_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                      maxRadius: 50,
                    ),
                    Positioned(
                      top: 70,
                      left: 70,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
              buildInputField("Name", nameController),
              buildInputField("Email Address", emailController),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFC8C8C8)),
              SizedBox(height: 20),
              Text(
                'Address Details',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
              buildInputField("Pincode", pincodeController),
              buildInputField("Address", addressController),
              buildInputField("City", cityController),
              buildInputField("State", stateController),
              buildInputField("Country", countryController),
              SizedBox(height: 20),
              Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
              buildInputField("Phone Number", phoneController),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF63758),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(context, "setting"),
    );
  }

  Column buildInputField(String name, TextEditingController userController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),

        Text(
          name,
          style: TextStyle(fontSize: 12, fontFamily: "Montserrat-Regular"),
        ),
        SizedBox(height: 15),
        TextField(
          controller: userController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            hintText: name,
            hintStyle: TextStyle(fontFamily: "Montserrat-Regular"),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
