class SelectItemsModel {
  int? count;
  String? next;
  Null? previous;
  List<Results>? results;

  SelectItemsModel({this.count, this.next, this.previous, this.results});

  SelectItemsModel.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? time;
  int? week;
  String? picture1;
  String? picture2;
  String? picture3;
  int? courseInstance;

  Results(
      {this.id,
        this.date,
        this.time,
        this.week,
        this.picture1,
        this.picture2,
        this.picture3,
        this.courseInstance});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    week = json['week'];
    picture1 = json['picture_1'];
    picture2 = json['picture_2'];
    picture3 = json['picture_3'];
    courseInstance = json['course_instance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['week'] = this.week;
    data['picture_1'] = this.picture1;
    data['picture_2'] = this.picture2;
    data['picture_3'] = this.picture3;
    data['course_instance'] = this.courseInstance;
    return data;
  }
}
