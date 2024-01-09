// ignore_for_file: must_be_immutable

part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

final class UserSavingState extends UserState {}

final class UserSavingSuccessState extends UserState {
  File? file;

  UserSavingSuccessState({required this.file});
}

final class UserSavingErrorState extends UserState {
  final String errormsg;

  const UserSavingErrorState({required this.errormsg});
}
