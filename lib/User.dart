// class User {
//   User({
//       this.id,
//       this.username,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.gender,
//       this.nationalId,
//       this.role,
//       this.student,});
//
//   User.fromJson(dynamic json) {
//     id = json['id'];
//     username = json['username'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     gender = json['gender'];
//     nationalId = json['national_id'];
//     role = json['role'];
//     student = json['student'];
//   }
//   int id;
//   String username;
//   String firstName;
//   String lastName;
//   String email;
//   String gender;
//   String nationalId;
//   String role;
//   dynamic student;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['username'] = username;
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     map['email'] = email;
//     map['gender'] = gender;
//     map['national_id'] = nationalId;
//     map['role'] = role;
//     map['student'] = student;
//     return map;
//   }
//
// }