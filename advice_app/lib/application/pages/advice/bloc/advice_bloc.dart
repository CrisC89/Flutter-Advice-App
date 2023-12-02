import 'package:advice_app/domain/usecases/advice.usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../domain/failures/failure.dart';

part 'advice_event.dart';
part 'advice_state.dart';

const generalFailureMessage = "Something gone wrong, please try again!";
const serverFailureMessage = "API Error, please try again";
const cacheFailureMessage = "Cache failed, please try again!";

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final AdviceUseCases adviceUseCases;

  AdviceBloc({required this.adviceUseCases}) : super(AdviceInitial()) {

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
              (advice) => emit(AdviceStateLoaded(advice: advice.advice)),
              (failure) => emit(AdviceStateError(message: _mapFailureToMessage(failure))));

   });
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default :
        return generalFailureMessage;
    }
  }
}
