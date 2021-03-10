import 'package:code_test/module/components/global_widgets.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget leading;
  final Widget trailing;

  const CustomScaffold({
    Key key,
    this.title,
    this.body,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 23),
              ),
              Container(
                width: 30,
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: theme.backgroundColor,
        child: body,
      ),
    );
  }
}
