import 'dart:developer';

import 'package:code_test/config/routes/routes.dart';
import 'package:code_test/module/encrypt/cubit/encrypt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'config/routes/app_router.dart';
import 'config/simple_bloc_observer.dart';
import 'config/theme/bloc/theme_bloc.dart';
import 'module/screens/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hydrated Bloc
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<EncryptCubit>(
          create: (BuildContext context) => EncryptCubit()),
      BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        log("theme: ${state.name}");
        return MaterialApp(
          title: 'Code Test',
          theme: state.themeData,
          initialRoute: SPLASH_SCREEN_ROUTE,
          onGenerateRoute: AppRouter().generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Home(),
    );
  }
}
