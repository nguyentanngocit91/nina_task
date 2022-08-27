import 'package:mongo_dart/mongo_dart.dart';

import '../networks/internet_checker/internet_connection_checker.dart';

class DBConnection {
  static var db, userCollection;

  static const String _dbname = "apptask";
  static const String _username = "apptask";
  static const String _password = "apptask123456";
  static const String _dbh = "cluster0.tunuobq.mongodb.net";

  static const String _userCollection = "users";

  static connect() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      db = await Db.create(_getConnectionString());
      await db.open();
      userCollection = db.collection(_userCollection);
    } else {
      print('No internet :( Reason:');
      // print(InternetConnectionChecker().lastTryResults);
    }
  }

  static _getConnectionString() {
    return "mongodb+srv://$_username:$_password@$_dbh/$_dbname";
  }
}
