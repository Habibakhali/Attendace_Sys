import 'package:dio/dio.dart';
import '/globals.dart' as globals;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static Dio? dio;
  static List<Map>? courseList;
  static intit() {
    dio = Dio(BaseOptions(
      baseUrl: "https://attendance-proof-production.up.railway.app/",
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> login(
      {required String email, required String password}) async {
    final request = {"username": email, "password": password};
    Response response = Response(requestOptions: RequestOptions(contentType: "application/json"));
    response= await dio!.post("login/", data: request);

    if (response.statusCode == 200) {
      globals.islogin = true;
      globals.token = response!.data['access'];
      //  print(globals.token);

      // userInformation();
      // getCourses();
      // getDepartment();
      // getLevel();
      return response!;

      print(response);
    }

    return response!;
  }

  static Future<Response?> userInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> Headers = {
      "Content-Type":"application/json",
      "Authorization": "JWT ${globals.token}"
    };

    Response response = await dio!
        .get('auth/users/me/', options: Options(headers: Headers));
    if(response.statusCode == 200){
      await prefs.setString('DoctorName', response.data['username']);


      // email= response.data['email'] ;
      // nameStudent= response.data['first_name'] +response.data['last_name'] ;

      //return response.data;
    }
    return null;

  }
}