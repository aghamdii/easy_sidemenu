import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easy_sidemenu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'easy_sidemenu Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            bottomRightBorder: 12,
            topRightBorder: 12,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.open,
              openSideMenuWidth: 100,
              selectedColor: Color(0xFFEDECF8),
              selectedIconColor: Color(0xFF5044B8),
              unselectedIconColor: Colors.black54,
              backgroundColor: Colors.white,
              selectedTitleTextStyle: TextStyle(color: Color(0xFF5044B8)),
              unselectedTitleTextStyle: TextStyle(color: Color(0xFF515151)),
              iconSize: 38,
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/easy_sidemenu.png',
                  ),
                ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                itemHeight: 40,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                iconPath: "assets/images/home_icon.svg",
              ),
              SideMenuItem(
                priority: 1,
                itemHeight: 40,
                title: 'Users',
                onTap: () {
                  page.jumpToPage(1);
                },
                iconPath: "assets/images/home_icon.svg",
              ),
              SideMenuItem(
                priority: 2,
                itemHeight: 40,
                title: 'Files',
                onTap: () {
                  page.jumpToPage(2);
                },
                iconPath: "assets/images/home_icon.svg",
              ),
              SideMenuItem(
                priority: 3,
                itemHeight: 40,
                title: 'Download',
                onTap: () {
                  page.jumpToPage(3);
                },
                iconPath: "assets/images/home_icon.svg",
              ),
              SideMenuItem(
                priority: 4,
                itemHeight: 40,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(4);
                },
                iconPath: "assets/images/home_icon.svg",
              ),
              SideMenuItem(
                priority: 6,
                itemHeight: 40,
                title: 'Exit',
                onTap: () async {},
                iconPath: "assets/images/home_icon.svg",
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Page\n   1',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   2',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   3',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   4',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   5',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
