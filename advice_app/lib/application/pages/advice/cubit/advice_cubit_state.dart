part of 'advice_cubit.dart';

@immutable
abstract class AdviceCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceCubitInitial extends AdviceCubitState {}

class AdviceCubitStateLoading extends AdviceCubitState {}

class AdviceCubitStateLoaded extends AdviceCubitState {
  final String advice;
  AdviceCubitStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceCubitStateError extends AdviceCubitState {
  final String message;
  AdviceCubitStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
