import 'package:flutter/material.dart';
import 'package:nail_makeup/component/nm_appbar.dart';
import 'package:nail_makeup/localization/flutter_localizations.dart';
import 'package:nail_makeup/localization/text_names.dart';
import 'package:nail_makeup/theme/app_theme.dart';

enum TabName {
  home,
  newsfeed,
  store,
  notifcation,
  user,
}

class Tab {
  GlobalKey<NavigatorState> navigatorKey;
  Widget icon;
  TabName tabName;

  Tab(this.navigatorKey, this.icon, this.tabName);
}

class NMMainScreen extends StatefulWidget {
  final TabName tabName;

  NMMainScreen({this.tabName = TabName.home});

  @override
  _NMMainScreenState createState() => _NMMainScreenState(tabName);
}

class _NMMainScreenState extends State<NMMainScreen> {
  final List<Tab> tabs = [
    Tab(GlobalKey<NavigatorState>(), Icon(Icons.home_outlined), TabName.home),
    Tab(GlobalKey<NavigatorState>(), Icon(Icons.shopping_bag_outlined),
        TabName.newsfeed),
    Tab(GlobalKey<NavigatorState>(), Icon(Icons.add_shopping_cart),
        TabName.store),
    Tab(GlobalKey<NavigatorState>(), Icon(Icons.event_note_outlined),
        TabName.notifcation),
    Tab(GlobalKey<NavigatorState>(), Icon(Icons.settings_applications_outlined),
        TabName.user),
  ];

  TabName currentTabName;
  _NMMainScreenState(this.currentTabName);

  late int _selectedIndex = 0;

  void setSelectedTabname(TabName name) {
    _selectedIndex = TabName.values.indexOf(name);

    if (_selectedIndex == -1) {
      _selectedIndex = 0;
    }

    setState(() {});
  }

  @override
  void initState() {
    var tabName = widget.tabName;

    setSelectedTabname(tabName);

    if (_selectedIndex == -1) {
      _selectedIndex = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NMAppBar(
        title: 'AppBar',
      ),
      body: _buildWidgetContent(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColor.black100,
            blurRadius: 0.5,
          )
        ]),
        child: BottomAppBar(
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: AppColor.white500,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: [
              ...tabs
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: e.icon,
                      ),
                      label: getTabTitle(context, e.tabName),
                    ),
                  )
                  .toList()
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColor.primary500,
            unselectedItemColor: AppColor.ink400,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 22,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }

  _buildWidgetContent() {
    Tab selected = tabs[_selectedIndex];
    switch (selected.tabName) {
      case TabName.home:
        return Container();
      case TabName.newsfeed:
        return Container();
      case TabName.store:
        return Container();
      case TabName.notifcation:
        return Container();
      case TabName.user:
        return Container();
    }
  }

  String? getTabTitle(BuildContext context, TabName tabName) {
    String? ret;
    switch (tabName) {
      case TabName.home:
        ret = NMLocalizations.of(context)!.getStringLabel(TextName.NM_001);
        break;
      case TabName.newsfeed:
        ret = NMLocalizations.of(context)!.getStringLabel(TextName.NM_002);
        break;

      case TabName.store:
        ret = NMLocalizations.of(context)!.getStringLabel(TextName.NM_003);
        break;
      case TabName.notifcation:
        ret = NMLocalizations.of(context)!.getStringLabel(TextName.NM_004);
        break;
      case TabName.user:
        ret = NMLocalizations.of(context)!.getStringLabel(TextName.NM_005);
        break;
      default:
    }
    return ret;
  }
}
