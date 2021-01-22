import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({this.worldData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2, crossAxisCount: 2),
        children: [
          StatusPanel(
            panelColor: Colors.red[100],
            textColor: Colors.red,
            title: 'CONFIRMED',
            count: worldData['updated'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            title: 'ACTIVE',
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            title: 'DEATHS',
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.green[100],
            textColor: Colors.green,
            title: 'RECOVERED',
            count: worldData['recovered'].toString(),
          )
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({this.panelColor, this.textColor, this.title, this.count});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      color: panelColor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          )
        ],
      ),
    );
  }
}
