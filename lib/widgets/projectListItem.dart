import 'package:circuitverse_mobile/utils/constants.dart';
import 'package:circuitverse_mobile/widgets/screens/projectDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectListItem extends StatelessWidget {
  final Widget thumbnail;
  final String id;
  final int viewcount;
  final int stars;
  final String description;
  final String name;

  const ProjectListItem(
      {this.thumbnail,
      this.viewcount,
      this.stars,
      this.description,
      this.name,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: id.toString());
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Constants.BASE_COLOR),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: thumbnail,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: _ProjectDescription(
                        name, description, viewcount, stars),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectDescription extends StatelessWidget {
  final String title;
  final String description;
  final int viewCount;
  final int starsCount;

  _ProjectDescription(
      this.title, this.description, this.viewCount, this.starsCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
            ),
          ),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'View this project',
              style: TextStyle(
                  color: Constants.BASE_COLOR, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
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
                        Icon(Icons.star),
                        Text(viewCount.toString()),
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
                      Icon(Icons.remove_red_eye),
                      Text(starsCount.toString()),
                    ],
                  ),
                ),
                flex: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
