// import 'User.dart';
// import 'CoursesTaught.dart';
//
// class Results {
//   Results({
//       this.id,
//       this.user,
//       this.coursesTaught,});
//
//   Results.fromJson(dynamic json) {
//     id = json['id'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     if (json['courses_taught'] != null) {
//       coursesTaught = [];
//       json['courses_taught'].forEach((v) {
//         coursesTaught.add(CoursesTaught.fromJson(v));
//       });
//     }
//   }
//   int id;
//   User user;
//   List<CoursesTaught> coursesTaught;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     if (user != null) {
//       map['user'] = user.toJson();
//     }
//     if (coursesTaught != null) {
//       map['courses_taught'] = coursesTaught.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }