import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_provider/core/firestore_helper.dart';
import 'package:fire_provider/core/toast_helper.dart';
import 'package:fire_provider/models/response.dart';
import 'package:fire_provider/models/user.dart';

class AuthService {
  Future<Response?> register(User user) async {
    try {
      CollectionReference userRef = FirestoreHelper().getCollectionRef("users");
      QuerySnapshot snapshot = await userRef.where("email", isEqualTo: user.email).get();
      List users = snapshot.docs.map((doc) => doc.data()).toList();
      if (users.length == 1) {
        return Response(type: "warning", message: "Account is already exists!");
      } else {
        await FirestoreHelper().create(userRef, user.toJson());
        return Response(type: "success", message: "Account created successfully!");
      }
    } catch (err) {
      ToastHelper.error("Something went wrong!");
      return null;
    }
  }

  Future<Response?> login(Map<String, String> request) async {
    try {
      CollectionReference userRef = FirestoreHelper().getCollectionRef("users");
      QuerySnapshot snapshot = await userRef.where("email", isEqualTo: request["email"]).where("password", isEqualTo: request["password"]).get();
      List users = snapshot.docs.map((doc) => doc.data()).toList();
      if (users.length == 1) {
        return Response(type: "success", message: "You can logged In!", data: users[0]);
      } else {
        return Response(type: "warning", message: "Invalid Credentials");
      }
    } catch (err) {
      ToastHelper.error("Something went wrong!");
      return null;
    }
  }
}
