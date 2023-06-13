import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'dart:io';

import '../api_model/DoctorCourses.dart';
import 'api/api_manager.dart';
// import 'package:api/api_manager.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  DoctorCourses? doctorCourses;

  File? _image;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile!.path);
      } else {
        print('No image selected.');
      }
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var selectedDate;

  List<String> itemList = [
    'comp205',
    'comp305',
    'comp201',
    'comp403',

  ];
  var valuechoose;

  Widget CoursesList() {
    return FutureBuilder(
      future: ApiManeger.GetDoctorCourses(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(),
              );
        } else if (snapshot.hasError) {
          return Text('Error');
        }
        var courses = snapshot.data.results?.coursesTaught ?? [];
        itemList = courses.map((course) => course.code ?? '').toList();
        valuechoose = courses[0];
        return DropdownButton(
          hint: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Select Course:',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          value: valuechoose,
          onChanged: (newValue) {
            setState(() {
              valuechoose = newValue.toString();
            });
          },
          items: itemList.map((course) {
            return DropdownMenuItem(
              value: course.codeUnits,
              child: Text(course.codeUnits as String),
            );
          }).toList(),
        );
      },
    );
  }

  final picker = ImagePicker();
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xff92E3A9),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: DropdownButton(
                              hint: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Select Course:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              value: valuechoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valuechoose = newValue.toString();
                                });
                              },
                              items: doctorCourses?.results![0].coursesTaught!
                                  .map((course) {
                                return DropdownMenuItem(
                                  value: course.name,
                                  child: Text(''),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                      MaterialButton(
                        onPressed: () {
                          getImageFromGallery();
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff92E3A9),
                          ),
                          child: const Center(
                              child: Text(
                            "Select Image",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff405565)),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xff92E3A9),
                            width: 2,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          '$_counter',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 380,
                    height: 340,
                    child: _image == null
                        ? Image.asset(
                            "assets/select.png",
                            fit: BoxFit.fill,
                          )
                        : Image.file(_image!),
                  ),
                  MaterialButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff92E3A9),
                      ),
                      child: const Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff405565)),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // var snakbar = SnackBar(content: Text("Please Enter Three image"));
                      // scaffoldkey.currentState?.showSnakbar(snakbar);
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff92E3A9),
                      ),
                      child: const Center(
                          child: Text(
                        "Take Attendance",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff405565)),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Image.asset("assets/select.png",fit: BoxFit.fill,),
