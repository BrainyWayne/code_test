import 'package:code_test/config/routes/routes.dart';
import 'package:code_test/config/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget cText(String text, bool bold, double size, Color color) {
  bool darkModeOn;
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  darkModeOn = brightness == Brightness.dark;
  if (color == Colors.white || color == Colors.black)
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
          fontFamily: bold == true ? "nunitobold" : "nunito",
          fontSize: size,
          color: color),
    );
  else {
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
          fontFamily: bold == true ? "nunitobold" : "nunito",
          fontSize: size,
          color: color),
    );
  }
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Material(child: widget)));
}

void navigateToReplace(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Material(child: widget)));
}

void goBackSafely(BuildContext context) {
  Navigator.popUntil(context, (ModalRoute.withName(ROOT_ROUTE)));
}

Widget cButton(String text, Color textColor, Color color, BuildContext context,
    {double width}) {
  return Container(
    width: width ?? MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Center(child: cText(text, true, 15, textColor)),
  );
}

Widget defaultButton(BuildContext context, Function onPressed()) {
  ThemeData theme = Theme.of(context);
  return MaterialButton(
    onPressed: () => onPressed,
    child: Container(),
  );
}

Widget materialButton(String text, Color color) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)),
        child: cText(text, false, 15, color),
      ),
    ],
  );
}

Widget backButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Card(
      color: BlocProvider.of<ThemeBloc>(context).state.name == "darkTheme"
          ? Colors.green
          : Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back),

        // Image.asset(
        //   "assets/images/icon back btn.png",
        //   height: 18,
        //   color: BlocProvider.of<ThemeBloc>(context).state.name == "darkTheme"
        //       ? Colors.white
        //       : Colors.green,
        // ),

        //   Icon(
        //   Icons.arrow_back,
        //   size: 18,
        //   color: BlocProvider.of<ThemeBloc>(context).state.name == "darkTheme"
        //       ? Colors.white
        //       : Colors.green,
        // ),
      ),
    ),
  );
}

Widget transparentSearchButton() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
  );
}

//! TODO taske Icon parameter
InputDecoration textFieldDecoration() {
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      suffixIcon: Icon(
        Icons.lock,
        size: 14,
      ),
      border: InputBorder.none);
}
