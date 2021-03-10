import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NestedScaffold extends StatefulWidget {
  final String title;
  final Widget trailing;
  final Widget leading;
  final Widget body;

  const NestedScaffold(
      {Key key, this.title, this.trailing, this.leading, this.body})
      : super(key: key);

  @override
  _NestedScaffoldState createState() => _NestedScaffoldState();
}

class _NestedScaffoldState extends State<NestedScaffold> {
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
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    CupertinoSliverNavigationBar(
                        backgroundColor: theme.backgroundColor,
                        largeTitle: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontSize: 20,
                              ),
                        ),
                        trailing: widget.trailing,
                        leading: widget.leading)
                  ];
                },
                body: Material(
                  color: theme.backgroundColor,
                  child: widget.body,
                ))));
  }
}
