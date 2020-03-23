import 'dart:developer' as developer;
import 'dart:convert';
import 'package:circuitverse_mobile/services/webservice.dart';
import 'package:circuitverse_mobile/utils/constants.dart';

class Project {
  final String id;
  final String image_url;
  final String description;
  final int view;
  final String name;
  final String author;
  final int stars_count;
  final String project_url;

  Project(
      {this.id,
      this.image_url,
      this.description,
      this.view,
      this.name,
      this.author,
      this.stars_count,
      this.project_url});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        id: json['id'],
        image_url:
            Constants.BASE_URL + json['attributes']['image_preview']['url'] ??
                Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
        description: json['attributes']['description'],
        view: json['attributes']['view'],
        name: json['attributes']['name'],
        author: json['attributes']['author'],
        stars_count: json['attributes']['stars_count'],
        project_url: json['attributes']['link_to_project']);
  }

  static Resource<List<Project>> get all {
    return Resource(
        url: Constants.ALL_PROJECTS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['data'];
          return list.map((model) => Project.fromJson(model)).toList();
        });
  }

  static Resource<Project> single(String id) {
    return Resource(
        url: Constants.PROJECT_DETAIL + id,
        parse: (response) {
          final result = json.decode(response.body);
          return Project.fromJson(result['data']);
        });
  }
}
