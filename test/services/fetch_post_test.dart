import 'dart:convert';
import 'dart:math';

import 'package:circuitverse_mobile/models/project.dart';
import 'package:circuitverse_mobile/services/webservice.dart';
import 'package:circuitverse_mobile/utils/constants.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

main() {
  group('Webservice', () {
    test('return single project on successful call in api/v0/projects/:id',
        () async {
      final webservice = Webservice();
      webservice.client = MockClient((request) async {
        final mapJson = {
          "data": {
            "id": "2",
            "type": "projects",
            "attributes": {
              "image_preview": {"url": "/img/default.png"},
              "description": "description",
              "view": 401,
              "tags": [
                {
                  "id": 1,
                  "name": "example",
                  "created_at": "2020-03-16T13:15:34.000Z",
                  "updated_at": "2020-03-16T13:15:34.000Z"
                }
              ],
              "name": "Public",
              "author": "user1",
              "stars_count": 0,
              "link_to_project": "/users/3/projects/2"
            }
          }
        };
        return Response(json.encode(mapJson), 200);
      });
      final item = await webservice.load(Project.single('1'));
      expect(item.view, 401);
    });

    test('return single project on successful call in api/v0/projects',
        () async {
      final webservice = Webservice();
      webservice.client = MockClient((request) async {
        final mapJson = {
          "data": [
            {
              "id": "2",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description": "description",
                "view": 401,
                "tags": [
                  {
                    "id": 1,
                    "name": "example",
                    "created_at": "2020-03-16T13:15:34.000Z",
                    "updated_at": "2020-03-16T13:15:34.000Z"
                  }
                ],
                "name": "Public",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/2"
              }
            },
            {
              "id": "4",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description": "description",
                "view": 3,
                "tags": [],
                "name": "Full Adder",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/4"
              }
            },
            {
              "id": "5",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description":
                    "SAP-1 short for simple as possible computer is a 8 Bit computer. It can perform simple operations like Addition and Subtraction.",
                "view": 6,
                "tags": [],
                "name": "SAP",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/5"
              }
            },
          ]
        };
        return Response(json.encode(mapJson), 200);
      });
      final listItem = await webservice.load(Project.all);
      expect(listItem.length > 1, true);
    });

    test('return single project on successful call in api/v0/projects',
        () async {
      final webservice = Webservice();
      webservice.client = MockClient((request) async {
        final mapJson = {
          "data": [
            {
              "id": "2",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description": "description",
                "view": 401,
                "tags": [
                  {
                    "id": 1,
                    "name": "example",
                    "created_at": "2020-03-16T13:15:34.000Z",
                    "updated_at": "2020-03-16T13:15:34.000Z"
                  }
                ],
                "name": "Public",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/2"
              }
            },
            {
              "id": "4",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description": "description",
                "view": 3,
                "tags": [],
                "name": "Full Adder",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/4"
              }
            },
            {
              "id": "5",
              "type": "projects",
              "attributes": {
                "image_preview": {"url": "/img/default.png"},
                "description":
                    "SAP-1 short for simple as possible computer is a 8 Bit computer. It can perform simple operations like Addition and Subtraction.",
                "view": 6,
                "tags": [],
                "name": "SAP",
                "author": "user1",
                "stars_count": 0,
                "link_to_project": "/users/3/projects/5"
              }
            },
          ]
        };
        return Response(json.encode(mapJson), 200);
      });
      final listItem = await webservice.load(Project.all);
      expect(listItem.length > 1, true);
    });
  });
}
