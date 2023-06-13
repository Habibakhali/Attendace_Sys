class DoctorCourses {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  DoctorCourses({this.count, this.next, this.previous, this.results});

  DoctorCourses.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  User? user;
  List<CoursesTaught>? coursesTaught;

  Results({this.id, this.user, this.coursesTaught});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['courses_taught'] != null) {
      coursesTaught = <CoursesTaught>[];
      json['courses_taught'].forEach((v) {
        coursesTaught!.add(new CoursesTaught.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.coursesTaught != null) {
      data['courses_taught'] =
          this.coursesTaught!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? nationalId;
  String? role;
  Null? student;

  User(
      {this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.nationalId,
        this.role,
        this.student});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    nationalId = json['national_id'];
    role = json['role'];
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['national_id'] = this.nationalId;
    data['role'] = this.role;
    data['student'] = this.student;
    return data;
  }
}

class CoursesTaught {
  int? id;
  String? name;
  int? creditHours;
  int? teacheringHours;
  String? code;
  String? description;

  CoursesTaught(
      {this.id,
        this.name,
        this.creditHours,
        this.teacheringHours,
        this.code,
        this.description});

  CoursesTaught.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    creditHours = json['credit_hours'];
    teacheringHours = json['Teachering_hours'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['credit_hours'] = this.creditHours;
    data['Teachering_hours'] = this.teacheringHours;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}