class User {
  final String uid;

  User({ this.uid });

}

class UserData {
  final String uid;
  final String clinic;
  final int curToken;
  final int lastToken;

  UserData({this.uid, this.clinic, this.curToken, this.lastToken});
}