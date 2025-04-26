class JwelleryModel {
  JwelleryModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  factory JwelleryModel.fromJson(Map<String, dynamic> json) {
    return JwelleryModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: (json["price"] is int) 
          ? (json["price"] as int).toDouble() 
          : (json["price"] ?? 0.0),
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json["rate"] is int)
          ? (json["rate"] as int).toDouble()
          : (json["rate"] ?? 0.0),
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
