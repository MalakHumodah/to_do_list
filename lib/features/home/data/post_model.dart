class PostModel {
  String? id;
  String? title;
  String? body;
  String? date;
  bool? isVisible;

  PostModel({this.id, this.title, this.body, this.date, this.isVisible});

  factory PostModel.fromMap(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        date: json['date'],
        isVisible: json['isVisible']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['date'] = date;
    data['isVisible'] = isVisible;
    return data;
  }

}
