import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advice_cubit_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceCubitInitial());

  void adviceRequested() async {
    emit(AdviceCubitStateLoading());
    //execute business logic
    // for example get and advice
    debugPrint('Fake Advice triggered');
    await Future.delayed(const Duration(seconds: 3), (){});
    debugPrint('Got advice');
    emit(AdviceCubitStateLoaded(advice: 'Fake advice to test bloc'));
    //emit(AdviceCubitStateError(message: 'Fake error message'));
  }
}
