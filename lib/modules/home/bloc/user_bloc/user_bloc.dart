import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/modules/home/models/user_modal.dart';
import '/modules/home/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetAllUsers>(_getAllUsers);
  }

  _getAllUsers(GetAllUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    List<UserModel> list = await userRepository.getAllUsers();
    emit(AllUsersLoaded(list));
  }
}
