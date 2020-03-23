import 'package:flutter/material.dart';

class Constants {
  static final String HEADLINE_NEWS_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=8a94764508db4e9d82cf69e282495026';

  static final String NEWS_PLACEHOLDER_IMAGE_ASSET_URL =
      'assets/placeholder.png';

  static final Color BASE_COLOR = Color(0xFF42B983);

  static final String BASE_URL = 'https://17119467.ngrok.io';

  static final String ALL_PROJECTS_URL = BASE_URL + '/api/v0/projects';

  static final String PROJECT_DETAIL = BASE_URL + '/api/v0/projects/';
}
