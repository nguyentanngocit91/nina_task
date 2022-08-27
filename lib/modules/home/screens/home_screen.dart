import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/modules/home/models/user_modal.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../repositories/user_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Design"),
      ),
      body: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(GetAllUsers()),
        child: WidgetListUser(),
      ),
    );
  }
}

class WidgetListUser extends StatefulWidget {
  const WidgetListUser({Key? key}) : super(key: key);

  @override
  State<WidgetListUser> createState() => _WidgetListUserState();
}

class _WidgetListUserState extends State<WidgetListUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AllUsersLoaded) {
            List<UserModel> listUser = state.listUser;
            return ListView.builder(
                itemCount: listUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listUser[index].email!),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
