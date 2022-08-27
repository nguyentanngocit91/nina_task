import 'package:mongo_dart/mongo_dart.dart';
import '/modules/home/models/user_modal.dart';
import '/utils/helpers/mongodb/dbconnection.dart';



class UserRepository {



  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];

    final listUsers = await DBConnection.userCollection
        .find(where.skip(300).limit(25))
        .toList();
    for (Map<String, Object?> obj in listUsers) {
      allUsers.add(UserModel().copyWith(
        id: obj['_id'].toString(),
        email: obj['email'].toString(),
        password: obj['password'].toString(),
        status: obj['status'] as int,
        token: obj['token'] as String,
      ));
    }
    return allUsers;
  }

}
