//import 'package:circular_check_box/circular_check_box.dart';
import 'package:etornam_vpn/screens/shared_widgets/server_list_widget.dart';
import 'package:etornam_vpn/screens/shared_widgets/server_selection.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class ServerListPage extends StatefulWidget {
  @override
  _ServerListPageState createState() => _ServerListPageState();
}

class _ServerListPageState extends State<ServerListPage> {

  ServerSelectionData serverSelectionData = new ServerSelectionData(flagAsset: "", label:"");

  final premiumServers = [
    ['assets/england.png', 'England'],
    ['assets/usa.jpg', 'United States'],
    ['assets/canada.png', 'Canada'],
    ['assets/france.png', 'France'],
    ['assets/ghana.png', 'Ghana'],
  ];

  List freeServers = [
    ['assets/england.png', 'England',false],
    ['assets/france.png', 'France',false],
    ['assets/ghana.png', 'Ghana',false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Servers',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          RichText(
              text: TextSpan(
                  text: 'Premuim ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
                  children: [
                TextSpan(
                    text: 'Servers',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.normal))
              ])),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: premiumServers.length,
              itemBuilder: (_, index) {
                return ServerItemWidget(
                  isFaded: true,
                    label: premiumServers[index][1],
                    icon: Icons.lock,
                    flagAsset: premiumServers[index][0],
                    onTap: () {});
              },
              separatorBuilder: (_, index) => SizedBox(height: 10),
            ),
          ),
          SizedBox(height: 30),
          RichText(
              text: TextSpan(
                  text: 'Free ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
                  children: [
                TextSpan(
                    text: 'Servers',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.normal))
              ])),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: freeServers.length,
              itemBuilder: (_, index) {
                return Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              backgroundImage: ExactAssetImage(
                                freeServers[index][0],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              freeServers[index][1],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Checkbox(
                          checkColor: Color.fromRGBO(37, 112, 252, 1),
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: freeServers[index][2],
                          shape: CircleBorder(),
                          onChanged: (bool x) {
                            serverSelectionData = ServerSelectionData(flagAsset: freeServers[index][0], label: freeServers[index][1]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    data: serverSelectionData,
                                  )),
                            );
                            /*setState(() {
                              //freeServers[index][2] = !freeServers[index][2];
                              serverSelectionData = ServerSelectionData(flagAsset: freeServers[index][0], label: freeServers[index][1]);
                            });*/
                          },
                        )
                        /*CircularCheckBox(
                          activeColor: Color.fromRGBO(37, 112, 252, 1),
                            value: freeServers[index][2],
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            onChanged: (bool x) {
                              setState(() {
                                freeServers[index][2] = !freeServers[index][2];
                              });
                            })*/
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 10),
            ),
          )
        ],
      ),
    );
  }
}
