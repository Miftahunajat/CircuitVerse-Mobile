import 'dart:developer' as developer;
import 'dart:ffi';

import 'package:circuitverse_mobile/models/project.dart';
import 'package:circuitverse_mobile/services/webservice.dart';
import 'package:circuitverse_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailState extends State<ProjectDetail> {
  @override
  void initState() {
    super.initState();
  }

  Widget titleSection(project) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Constants.BASE_COLOR),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            project.name,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      );
  Widget descriptionSection(project) => Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'By : ' + project.author,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Created at : ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '16, May 2019',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Description :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  project.description,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      );
  Widget statusSection(project) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 42,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        project.stars_count.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_red_eye,
                    size: 42,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(project.view.toString(),
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            flex: 2,
          )
        ],
      );
  Widget buttonSection(project) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Constants.BASE_COLOR)),
          child: InkWell(
            onTap: () {
              _launchUrl(Constants.BASE_URL + project.project_url);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Text(
                'View Project in CircuitVerse',
                style: TextStyle(color: Constants.BASE_COLOR),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Detail'),
        centerTitle: true,
        backgroundColor: Constants.BASE_COLOR,
      ),
      body: FutureBuilder(
        future: _getProjectDetail(widget.id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Project project = snapshot.data;
            return Column(
              children: <Widget>[
                project.image_url == null
                    ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
                    : Image.network(
                        project.image_url,
                      ),
                titleSection(project),
                descriptionSection(project),
                statusSection(project),
                buttonSection(project)
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }

  Future<Project> _getProjectDetail(String id) async {
    return Webservice().load(Project.single(id));
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ProjectDetail extends StatefulWidget {
  final String id;

  @override
  State createState() => ProjectDetailState();

  ProjectDetail({this.id, Key key}) : super(key: key);
}
