import 'dart:async';
import 'dart:convert';

import 'package:code_test/config/theme/app_themes.dart';
import 'package:code_test/util/constants.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc()
      : super(ThemeState(
            name: LIGHTTHEME,
            themeData: AppThemes.appThemeData[AppTheme.lightTheme]));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is DarkThemeEvent) {
      yield (ThemeState(
          name: DARKTHEME,
          themeData: AppThemes.appThemeData[AppTheme.darkTheme]));
    } else if (event is LightThemeEvent) {
      yield (ThemeState(
          name: LIGHTTHEME,
          themeData: AppThemes.appThemeData[AppTheme.lightTheme]));
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return state.toMap();
  }
}
