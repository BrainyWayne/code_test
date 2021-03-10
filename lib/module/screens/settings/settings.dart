import 'package:code_test/config/theme/bloc/theme_bloc.dart';
import 'package:code_test/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Material(
        child: CupertinoPageScaffold(
            child: NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          CupertinoSliverNavigationBar(
            backgroundColor: theme.backgroundColor,
            largeTitle: Text(
              "Settings",
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: 20,
                  ),
            ),
            //middle: Container(),
            // previousPageTitle: "Profile",
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                size: 22,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ];
      },
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Scrollbar(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return SwitchListTile(
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (bool value) {
                      if (!value) {
                        context.read<ThemeBloc>().add(LightThemeEvent());
                      } else {
                        context.read<ThemeBloc>().add(DarkThemeEvent());
                      }
                    },
                    value: state.name == LIGHTTHEME ? false : true,
                  );
                },
              )
            ],
          ),
        ),
      ),
    )));
  }
}
