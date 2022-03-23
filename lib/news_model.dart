class NewsModel {
  final String title;
  final String source;
  final String description;
  final String readTime;
  final String publishedDate;
  final String url;
  final String photoUrl;

  const NewsModel({
    required this.title,
    required this.source,
    required this.description,
    required this.readTime,
    required this.publishedDate,
    required this.url,
    required this.photoUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    String newPhotoUrl = "";
    String newDescription = "";
    if (json['photoUrl'] != null) {
      newPhotoUrl = json['photoUrl'] as String;
    }
    if (json['description'] != null) {
      newDescription = json['description'] as String;
    }
    return NewsModel(
      title: json['title'] as String,
      source: json['source'] as String,
      description: newDescription,
      readTime: json['readTime'] as String,
      publishedDate: json['publishedDate'] as String,
      url: json['url'] as String,
      photoUrl: newPhotoUrl,
    );
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'source': source,
        'description': description,
        'readTime': readTime,
        'publishedDate': publishedDate,
        'url': url,
        'photoUrl': photoUrl,
      };
}
