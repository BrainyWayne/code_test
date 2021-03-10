import 'dart:developer';

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    log('Bloc event: ' + event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('Bloc transition: ' + transition.toString());
    super.onTransition(bloc, transition);
  }

  // @override
  // void onChange(Cubit cubit, Change change) {
  //   log('Bloc change: ' + change.toString());
  //   super.onChange(cubit, change);
  // }

  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   log('Bloc error: ' + error.toString());
  //   log(stackTrace.toString());
  //   super.onError(cubit, error, stackTrace);
  // }
}
