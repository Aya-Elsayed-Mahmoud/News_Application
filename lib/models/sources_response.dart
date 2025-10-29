import 'dart:convert';

SourcesResponse sourcesResponseFromJson(String str) =>
    SourcesResponse.fromJson(json.decode(str));

String sourcesResponseToJson(SourcesResponse data) =>
    json.encode(data.toJson());

class SourcesResponse {
  SourcesResponse({required this.sources, required this.status});

  List<Source> sources;
  String status;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      SourcesResponse(
        sources: json["sources"] == null
            ? []
            : List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
    "status": status,
  };
}

class Source {
  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    url: json["url"] ?? "",
    category: json["category"] ?? "",
    language: json["language"] ?? "",
    country: json["country"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category,
    "language": language,
    "country": country,
  };
}
