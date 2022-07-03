import 'dart:ui';

class ModelCategory {
  late String id;
  late String title;
  late String color;
  late Color resolvedColor;

  ModelCategory({this.id = "", this.title = "", this.color = ""});

  ModelCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    resolvedColor = Color(int.parse(color, radix: 16) | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }

  @override
  String toString() {
    return 'ModelCategory{id: $id, title: $title, color: $color}';
  }
}
