import 'package:circuitverse_mobile/models/project.dart';
import 'package:circuitverse_mobile/services/webservice.dart';
import 'package:circuitverse_mobile/utils/constants.dart';
import 'package:circuitverse_mobile/widgets/projectListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectsListState extends State<ProjectList> {
  List<Project> _projects = List<Project>();

  @override
  void initState() {
    super.initState();
    _populateProjects();
  }

  void _populateProjects() {
    Webservice().load(Project.all).then((projects) => {
          setState(() => {_projects = projects})
        });
  }

  ProjectListItem _buildItemsForListView(BuildContext context, int index) {
    final Project project = _projects[index];
    return ProjectListItem(
        thumbnail: Container(
          child: Container(
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.grey[500])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: project.image_url == null
                  ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
                  : Image.network(
                      project.image_url,
                    ),
            ),
          ),
        ),
        viewcount: project.view,
        stars: project.stars_count,
        description: project.description,
        name: project.name,
        id: project.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.BASE_COLOR,
          title: Text('CircuitVerse'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: _projects.length, itemBuilder: _buildItemsForListView));
  }
}

class ProjectList extends StatefulWidget {
  @override
  State createState() => ProjectsListState();
}
