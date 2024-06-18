part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final QuotesEntity data;
  const HomeSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class HomeError extends HomeState {
  final String textError;
  const HomeError({required this.textError});

  @override
  List<Object> get props => [textError];
}