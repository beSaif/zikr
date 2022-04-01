import 'package:flutter/material.dart';
import 'package:zikr/screens/home/components/body.dart';
import 'package:zikr/utils/sizedbox.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({Key? key}) : super(key: key);

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final userName = TextEditingController();
  var user;
  //var hintColor = Color(Colors.red);
  var hintText = 'eg: be.saif';
  var hintColor = Colors.white;
  double hintSize = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("asset/image/bg.jpg"),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: userName,
                  onChanged: (value) =>
                      {print('User: ${userName.text}'), user = value},
                  cursorColor: Colors.white,
                  style: const TextStyle(
                      fontFamily: 'Halenoir',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),
                    hintText: hintText,
                    labelText: 'username',
                    labelStyle: const TextStyle(
                        fontFamily: 'Halenoir',
                        color: Colors.white54,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                        fontFamily: 'Halenoir',
                        color: hintColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                verticalBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Log In Triggered");
                        if (user == null) {
                          print('Forgot to fill the name');
                          setState(() {
                            hintText = 'you forgot to fill me :(';
                            hintColor = Colors.red.shade300;
                            hintSize = 18;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Body(user: user),
                              ));
                        }
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontFamily: 'Halenoir',
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    horizontalBox(10)
                  ],
                ),
              ],
            ),
            verticalBox(20),
            Column(
              children: const [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontFamily: 'Halenoir',
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Enter a username to create one",
                  style: TextStyle(
                      fontFamily: 'Halenoir',
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
