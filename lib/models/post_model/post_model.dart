// static list for the levels
final levels = [
  '655b4ec133dd362ae53081f7',
  '655b4ecd33dd362ae53081f9',
  '655b4ee433dd362ae53081fb',
  '655b4efb33dd362ae53081fd',
  '655b4f0a33dd362ae53081ff',
];

class HomePostsModel {
  final String message;
  final List<Outcome> result;

  HomePostsModel({
    required this.message,
    required this.result,
  });

  factory HomePostsModel.fromJson(Map<String, dynamic> json) => HomePostsModel(
        message: json["message"],
        result: json["result"] != null
            ? List<Outcome>.from(json["result"].map((x) => Outcome.fromJson(x)))
            : [],
      );
}

class Outcome {
  final String id;
  final String educationLevel;
  final List<Post> posts;

  Outcome({
    required this.id,
    required this.educationLevel,
    required this.posts,
  });

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
        id: json["_id"],
        educationLevel: json["educationLevel"],
        posts: json["posts"] != null
            ? List<Post>.from(json["posts"].map((x) => Post.fromJson(x)))
            : [],
      );
}

class Post {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String? postType;
  final int price;
  final String grade;
  final String bookEdition;
  final String educationLevel;
  final String? postStatus;
  final int views;
  final String? feedback;
  final int numberOfBooks;
  final String semester;
  final String educationType;
  final String location;
  final String city;
  final String? identificationNumber;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int postId;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    this.postType,
    required this.price,
    required this.grade,
    required this.bookEdition,
    required this.educationLevel,
    this.postStatus,
    required this.views,
    this.feedback,
    required this.numberOfBooks,
    required this.semester,
    required this.educationType,
    required this.location,
    required this.city,
    this.identificationNumber,
    required this.createdAt,
    this.updatedAt,
    required this.postId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        postType: json["postType"] ?? '',
        price: json["price"] != null
            ? json["price"] is int
                ? int.parse(json["price"])
                : int.parse(json["price"])
            : 55,
        grade: json["grade"],
        bookEdition: json["bookEdition"],
        educationLevel: json["educationLevel"],
        postStatus: json["postStatus"],
        views: json["views"],
        feedback: json["feedback"],
        numberOfBooks: json["numberOfBooks"],
        semester: json["educationTerm"],
        educationType: json["educationType"],
        location: json["location"],
        city: json["city"] ?? '',
        identificationNumber: json["identificationNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        postId: json["postId"],
      );
}
