part of 'user_bloc.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class AllUsersLoaded extends UserState {
  final List<UserModel> listUser;

  AllUsersLoaded(this.listUser);

  @override
  List<Object> get props => [listUser];
}
