part of 'searcha_bloc.dart';

@immutable
abstract class SearchaState {}

class SearchaInitial extends SearchaState {}
class SearchLoading extends SearchaState {}

class SearchLoaded extends SearchaState {}

class SearchError extends SearchaState {}
