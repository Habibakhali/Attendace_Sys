import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:malak/api_model/DoctorCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_model/Attandance.dart';
import '../api_model/DoctorCourses.dart';
import '../api_model/select_item_model.dart';


class ApiManeger {
  static const String baseUrl = "https://attendance-proof-production.up.railway.app/";

  static Future <DoctorCourses> GetDoctorCourses() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.get('DoctorId');
    print('userId');
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/collage/teachers/?user=6");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    DoctorCourses student = DoctorCourses.fromJson(json);
    print(student);
    return student ;
  }
  static Future <Attandence> GetStudentsAttandance() async{
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/tracker/attendances/?attend=1&lecture=1&lecture__course_instance=1");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    Attandence attandence = Attandence.fromJson(json);
    print("attandence = ${attandence}");
    return attandence ;
  }

  static Future <Attandence> GetStudentsAbsent() async{
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/tracker/attendances/?attend=0&lecture=1&lecture__course_instance=1");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    Attandence attandence = Attandence.fromJson(json);
    print("absent = ${attandence}");
    return attandence ;
  }
  static Future<int> StoreImage(File image1,File img2,File img3)async{
    var img1 = await http.MultipartFile.fromPath('picture_1', image1.path);
    var im2 = await http.MultipartFile.fromPath('picture_2', img2.path);
    var im3 = await http.MultipartFile.fromPath('picture_3', img3.path);
    var request = http.MultipartRequest('POST', Uri.parse('https://attendance-proof-production.up.railway.app/tracker/lectures/'))
      ..files.add(img1)
    ..files.add(im2)
    ..files.add(im3);
    http.Response response = await http.Response.fromStream(await request.send());
    // var json=jsonDecode(response.body);
    // var res=SelectItemsModel.fromJson(json);
    print('====================================');
    print(response.statusCode);
    return response.statusCode;
  }

}