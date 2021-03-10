import 'dart:convert';

import 'package:flutter/material.dart';

class WidgetModel {
  final String title;
  final String subtitle;
  final String routeTo;
  final IconData iconData;

  WidgetModel(
    this.title,
    this.subtitle,
    this.routeTo,
    this.iconData,
  );

  WidgetModel copyWith({
    String title,
    String subtitle,
    String routeTo,
    IconData iconData,
  }) {
    return WidgetModel(
      title ?? this.title,
      subtitle ?? this.subtitle,
      routeTo ?? this.routeTo,
      iconData ?? this.iconData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'routeTo': routeTo,
      'iconData': iconData?.codePoint,
    };
  }

  factory WidgetModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WidgetModel(
      map['title'],
      map['subtitle'],
      map['routeTo'],
      IconData(map['iconData'], fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetModel.fromJson(String source) =>
      WidgetModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WidgetModel(title: $title, subtitle: $subtitle, routeTo: $routeTo, iconData: $iconData)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WidgetModel &&
        o.title == title &&
        o.subtitle == subtitle &&
        o.routeTo == routeTo &&
        o.iconData == iconData;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        routeTo.hashCode ^
        iconData.hashCode;
  }
}
