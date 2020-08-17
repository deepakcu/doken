import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doken/models/doken.dart';
import 'package:doken/models/user.dart';

class DatabaseService {
  // collection reference
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference dokenCollection = Firestore.instance.collection("doken");

  Future updateUserData(String clinic, int curToken, int lastToken) async {

    return await dokenCollection.document(uid).setData(
      {
        'clinic': clinic,
        'curToken': curToken,
        'lastToken': lastToken,
      }
    );
  }

  // get a doken list from snapshot
  List<Doken> _dokenListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Doken(
          clinic: doc.data['clinic'] ?? '',
          curToken: doc.data['curToken'] ?? 0,
          lastToken: doc.data['lastToken'] ?? 0,
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      clinic: snapshot.data['clinic'],
      curToken: snapshot.data['curToken'],
      lastToken: snapshot.data['lastToken']
    );
  }

  // get doken stream
  Stream<List<Doken>> get doken {
    return dokenCollection.snapshots().map(_dokenListFromSnapshot);
  }

  // get user document stream
  Stream<UserData> get userData {
    return dokenCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}