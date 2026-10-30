class JobModel {
  final int id;
  final String logoAsset;
  final String title;
  final String company;
  final String location;
  final String duration;
  final String createdAt;
  final String type;
  final String description;
  final List<String> requirements;
  final List<String> responsibilities;
  final List<String> benefits;
  final List<String> reviews;

  JobModel({
    required this.id,
    required this.logoAsset,
    required this.title,
    required this.company,
    required this.location,
    required this.duration,
    required this.createdAt,
    required this.type,
    required this.description,
    required this.requirements,
    required this.responsibilities,
    required this.benefits,
    required this.reviews,
  });
}
