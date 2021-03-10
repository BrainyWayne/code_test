import 'package:code_test/config/routes/routes.dart';
import 'package:code_test/config/theme/bloc/theme_bloc.dart';
import 'package:code_test/module/components/custom_scaffold.dart';
import 'package:code_test/module/components/nested-scaffold/nested_scaffold.dart';
import 'package:code_test/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'model/widget_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScaffold(
      title: "Code Test",
      leading: Container(),
      body: Body(),
      trailing: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SETTINGS);
        },
        child: Icon(
          Ionicons.ios_cog,
          size: 20,
        ),
      ),
    );
  }
}

List<WidgetModel> fetchModules() {
  return [
    WidgetModel(
      "Encrypt",
      "Two-Way Data Encryption",
      ENCRYPT,
      Ionicons.ios_analytics,
    ),
    WidgetModel(
      "Encrypt",
      "Two-Way Data Encryption",
      ENCRYPT,
      Ionicons.ios_analytics,
    ),
  ];
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final modules = fetchModules();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
            child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, modules[index].routeTo);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: state.name == LIGHTTHEME
                        ? Colors.grey.withOpacity(0.5)
                        : Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    Icon(modules[index].iconData),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          modules[index].title,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          modules[index].subtitle,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
      },
    );
  }
}
