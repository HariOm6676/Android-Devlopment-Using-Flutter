import 'package:flutter/material.dart';
import 'package:test_app/utils/routes.dart';
import 'package:test_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                "Welcome $name",
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
                         validator: (value){
                          if(value==null || value.isEmpty)
                          {
                            return "Password cannot be empty";
                          
                          }
                          
                           
                           return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                          validator: (value){
                          if(value==null ||  value.isEmpty)
                          {
                            return "Password cannot be empty";
                          
                          }
                           else if(value.length <6){
                            return "Password must be of 6 characters";
                           }
                           return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: MyTheme.creamColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              shape: changeButton
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                            ),
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //     onPressed: () {
                      //       // print("Harry's Application");
                      //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     },
                      //     child: Text("Login"),
                      //     style: TextButton.styleFrom(minimumSize: Size(150, 40)))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });
    await Future.delayed(
      Duration(seconds: 1),
    );
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
    }
  }
}
