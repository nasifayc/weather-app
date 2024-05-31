class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  Map<String, dynamic> toJson() {
    return {"text": text, "icon": icon};
  }

  factory Condition.fromMap(Map<String, dynamic> json) {
    String url = 'https:${json['icon']}';
    return Condition(
      text: json['text'],
      icon: url,
    );
  }
}
