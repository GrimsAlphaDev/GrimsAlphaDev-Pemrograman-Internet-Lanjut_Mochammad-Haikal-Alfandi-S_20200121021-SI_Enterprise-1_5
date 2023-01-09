import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pertama/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;

  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchFriendController,
      tittleController,
      descriptionController,
      dueDateController;

  @override
  void onInit() {
    super.onInit();
    searchFriendController = TextEditingController();
    tittleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFriendController.dispose();
    tittleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // print user email
    print(googleUser!.email);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    // firebase
    CollectionReference users = Firestore.collection('users');

    final cekUsers = await users.doc(googleUser.email).get();
    if (!cekUsers.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'created_at': _userCredential!.user!.metadata.creationTime.toString(),
        'lastLoginAt': _userCredential!.user!.metadata.lastSignInTime.toString()
        // 'list_cari' : [R,RE,REZ,REZA]
      }).then((value) async {
        String temp = '';
        try {
          for (var i = 0; i < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            await users.doc(googleUser.email).set({
              'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
    } else {
      users.doc(googleUser.email).update({
        'lastLoginAt': _userCredential!.user!.metadata.lastSignInTime.toString()
      });
    }

    Get.offAllNamed(Routes.HOME);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  var kataCari = [].obs;
  var hasilPencarian = [].obs;
  void searchFriends(String keyword) async {
    CollectionReference users = Firestore.collection('users');

    if (keyword.isNotEmpty) {
      final hasilQuery = await users
          .where('list_cari', arrayContains: keyword.toUpperCase())
          .get();

      if (hasilQuery.docs.isNotEmpty) {
        for (var i = 0; i < hasilQuery.docs.length; i++) {
          kataCari.add(hasilQuery.docs[i].data() as Map<String, dynamic>);
        }
      }

      if (kataCari.isNotEmpty) {
        hasilPencarian.value = [];
        kataCari.forEach((element) {
          print(element);
          hasilPencarian.add(element);
        });
        kataCari.clear();
      }
    } else {
      kataCari.value = [];
      hasilPencarian.value = [];
    }
    kataCari.refresh();
    hasilPencarian.refresh();
  }

  void addFriends(String _emailFriends) async {
    CollectionReference friends = Firestore.collection('friends');

    final cekFriends = await friends.doc(auth.currentUser!.email).get();
    // cek data ada atau tidak
    if (cekFriends.data() == null) {
      await friends.doc(auth.currentUser!.email).set({
        'emailMe': auth.currentUser!.email,
        'emailFriends': [_emailFriends],
      }).whenComplete(
          () => Get.snackbar("Friends", "Friends successfuly added"));
    } else {
      await friends.doc(auth.currentUser!.email).set({
        'emailFriends': FieldValue.arrayUnion([_emailFriends]),
      }, SetOptions(merge: true)).whenComplete(
          () => Get.snackbar("Friends", "Friends successfuly added"));
    }
    kataCari.clear();
    hasilPencarian.clear();
    searchFriendController.clear();
    Get.back();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamFriends() {
    return Firestore.collection('friends')
        .doc(auth.currentUser!.email)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers(String email) {
    return Firestore.collection('users').doc(email).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPeople() async {
    CollectionReference users = Firestore.collection('friends');
    final cekFriends = await users.doc(auth.currentUser!.email).get();
    var listFriends =
        (cekFriends.data() as Map<String, dynamic>)['emailFriends'] as List;
    QuerySnapshot<Map<String, dynamic>> hasil =
        await Firestore.collection('users')
            .where('email', whereNotIn: listFriends)
            .get();

    return hasil;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamTask(String taskId) {
    return Firestore.collection('task').doc(taskId).snapshots();
  }

  void saveUpdateTask(
    String title,
    String description,
    String dueDate,
    String docId,
    String type,
  ) async {
    print(title);
    print(description);
    print(dueDate);
    print(docId);
    print(type);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    CollectionReference taskColl = Firestore.collection('task');
    CollectionReference usersColl = Firestore.collection('users');
    var taskId = DateTime.now().toIso8601String();
    if (type == 'Add') {
      await taskColl.doc(taskId).set({
        'title': title,
        'description': description,
        'due_date': dueDate,
        'status': '0',
        'total_task': '0',
        'total_task_finished': '0',
        'task_detail': [],
        'asign_to': [auth.currentUser!.email],
        'created_by': auth.currentUser!.email,
      }).whenComplete(() async {
        await usersColl.doc(auth.currentUser!.email).set({
          'task_id': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Successfuly $type');
      }).catchError((error) {
        Get.snackbar('Error', 'Successfuly $type');
      });
    } else {
      await taskColl.doc(docId).update({
        'title': title,
        'description': description,
        'due_date': dueDate,
      }).whenComplete(() async {
        // await usersColl.doc(auth.currentUser!.email).set({
        //   'task_id': FieldValue.arrayUnion([taskId])
        // }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Successfuly $type');
      }).catchError((error) {
        Get.snackbar('Error', 'Successfuly $type');
      });
    }
  }

  void deleteTask(String taskId) async {
    CollectionReference taskColl = Firestore.collection('task');
    CollectionReference usersColl = Firestore.collection('users');

    await taskColl.doc(taskId).delete().whenComplete(() async {
      await usersColl.doc(auth.currentUser!.email).set({
        'task_id': FieldValue.arrayRemove([taskId])
      }, SetOptions(merge: true));
      Get.back();
      Get.snackbar('Task', 'Successfuly deleted');
    });
  }
}
