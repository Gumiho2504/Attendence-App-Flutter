import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHeight = 0;
  double screewidth = 0;
  Color primary = const Color(0xffeef444c);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 2.5,
            width: screewidth,
            decoration: BoxDecoration(
                color: primary,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(70))),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: screewidth / 5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenHeight / 15, bottom: screenHeight / 20),
            child: Text(
              "Login",
              style:
                  TextStyle(fontSize: screewidth / 18, fontFamily: "NexaBold"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screewidth/ 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                fieldTitle("Employee ID"),
                customField("Enter your employee ID",idController),
                fieldTitle("Password"),
                customField("Enter your password",passController),
              ]
            ),)
        ],
      ),
    );
  }
  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
            fontSize: screewidth / 26,
            fontFamily: "NexaBold"
        ),
      ),
    );
  }
  Widget customField (String hint, TextEditingController controller)=>Container(
    margin: EdgeInsets.only(bottom: 12),
    width: screewidth,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2,2)
          )
        ]
    ),
    child: Row(
      children: [
        Container(
          width: screewidth / 6,
          child: Icon(
            Icons.person,
            color: primary,
            size: screewidth/15,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: screewidth/6),
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: screenHeight /35),
                border: InputBorder.none,
                hintText: hint,
              ),
              maxLines: 1,
            ),
          ),
        )
      ],
    ),
  );
}
