class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  Map<String, dynamic> toJson() {
    return {"text": text, "icon": icon};
  }

  factory Condition.fromMap(Map<String, dynamic> json) {
    String url = 'https:${json['icon']}';
    // if (json['icon'].startswith('http://') ||
    //     json['icon'].startswith('https://')) {
    //   url = json['icon'];
    // } else {
    //   url = 'https:${json['icon']}';
    // }
    return Condition(
      text: json['text'],
      icon: url,
    );
  }
}
// if (url.startsWith('http://') || url.startsWith('https://')) {
//     return url;
//   } else {
//     return 'https:$url';
//   }