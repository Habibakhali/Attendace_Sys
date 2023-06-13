class AttendanceDate{

   String? Name;
   String? Id;
   String? TotalPresant;


  AttendanceDate({
    required this.Id,
    required this.Name,
    required this.TotalPresant,

  });
  List<dynamic> toList() {
    return [Id, Name, TotalPresant ];
  }
}