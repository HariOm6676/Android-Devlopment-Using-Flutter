import 'package:flutter/material.dart';
import 'package:test_app/utils/routes.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 244, 242, 242),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              // height: 500.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // print("Harry's Application");
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(150, 40)))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
