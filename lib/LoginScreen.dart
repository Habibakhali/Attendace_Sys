import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SlideBar.dart';
import 'dashboard.dart';
import 'dio_helper.dart';
import '/globals.dart' as globals;

GlobalKey<FormState> key1 = GlobalKey<FormState>();
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState
    ();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailControlar = TextEditingController();
  var passwordControlar = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              height: 450,
              child: Image.asset("assets/Secure login-bro (1).png",fit: BoxFit.fill,),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              height: 400,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              // color: Colors.white,
              child: SingleChildScrollView(//عشان تخليني اقدر اسكرول
                child:
                Form(
                  key: key1,
                  child: Column(
                    children: [
                      SizedBox(height: 80,),
                      TextFormField(
                          validator: (value) {
                            bool ?emailValid;
                            emailValid =
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                                    .hasMatch(emailControlar.text!);
                            if (emailValid == false) {
                              return 'Please check your Email';
                            }
                          },
                          controller: emailControlar,
                          keyboardType:TextInputType.emailAddress,

                          onFieldSubmitted: (value)
                          {
                            print(value);
                          },
                          decoration: InputDecoration(
                            hintText:'Email',
                            labelText:'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),
                            disabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),

                          )),
                      SizedBox(height: 20,)
                      , TextFormField(
                          controller: passwordControlar,
                          keyboardType:TextInputType.visiblePassword,
                          obscureText: isPassword,
                          validator: (value) {
                            if (value == 0 || value == '') {
                              return 'Please check your Password';
                            }
                          },
                          onFieldSubmitted: (value)
                          {
                            print(value);
                          },
                          decoration: InputDecoration(
                            hintText:'Password',
                            labelText:'  Password',
                            suffixIcon:GestureDetector(onTap: (){
                              setState(() {
                                isPassword=!isPassword;
                              });
                            },
                                child: Icon(isPassword? Icons.visibility_off : Icons.visibility,)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),
                            disabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.0
                              ),
                            ),

                          )),
                      SizedBox(height: 50,),
                      MaterialButton(onPressed:() async {
                        print(emailControlar.text);
                        print(passwordControlar.text);

                        if (key1.currentState!.validate())
                        {
                          await DioHelper.login(email: emailControlar.text,password: passwordControlar.text);
                          if (!globals.islogin)
                           {
                             showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'كلمة المرور او الايميل غير صحيح'
                                  ),
                                  actions: <TextButton>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                ));
                          }
                          else Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SlideBar();
                            }));


                        }
                      },
                        child: Text('Login',
                          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,),),
                        minWidth: 150,
                        height: 50,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        ),
                        color:Color(0xff92E3A9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}