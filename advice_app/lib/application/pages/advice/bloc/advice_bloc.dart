import 'dart:async';

import 'package:advice_app/domain/entities/advice.entity.dart';
import 'package:advice_app/domain/usecases/advice.usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    final AdviceUseCases adviceUseCases = new AdviceUseCases();

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      final AdviceEntity advice = await adviceUseCases.getAdvice();
      emit(AdviceStateLoaded(advice: advice.advice));
      //emit(AdviceStateError(message: 'Fake error message'));
   });
  }
}
