part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final String name;
  final ThemeData themeData;

  ThemeState({@required this.name, this.themeData});

  @override
  List<Object> get props => [name, themeData];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ThemeState(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source));
}
