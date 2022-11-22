class SafeModel {
  int? id;
  String project, category, rule, recommendation, description, image;

  SafeModel(
      {this.id,
      required this.project,
      required this.category,
      required this.image,
      required this.rule,
      required this.recommendation,
      required this.description});

  factory SafeModel.fromJson(Map<String, dynamic> json) => SafeModel(
        id: json['id'],
        project: json['project'],
        category: json['category'],
        rule: json['rule'],
        recommendation: json['recommendation'],
        description: json['description'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project': project,
      'category': category,
      'rule': rule,
      'recommendation': recommendation,
      'description': description,
      'image': image
    };
  }
}
