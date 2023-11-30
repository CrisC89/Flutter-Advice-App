import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
   on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      //execute business logic
     // for example get and advice
     debugPrint('Fake Advice triggered');
     await Future.delayed(const Duration(seconds: 3), (){});
      debugPrint('Got advice');
      emit(AdviceStateLoaded(advice: 'Fake advice to test bloc'));
      //emit(AdviceStateError(message: 'Fake error message'));
   });
  }
}
