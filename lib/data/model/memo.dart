class Memo {
  final String title;
  final String body;

  Memo({required this.title, required this.body});

  Memo.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title']! as String,
          body: json['body']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
