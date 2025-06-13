class Plan {
  final int id;
  final String title;
  final String level;
  final String date;
  final String time;
  final String room;
  final String trainer;

  Plan({
    required this.id,
    required this.title,
    required this.level,
    required this.date,
    required this.time,
    required this.room,
    required this.trainer,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      title: json['title'],
      level: json['level'],
      date: json['date'],
      time: json['time'],
      room: json['room'],
      trainer: json['trainer'],
    );
  }
}
