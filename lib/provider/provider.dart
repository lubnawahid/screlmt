import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

List _name=[];
 List _email=[];
 List _phone=[];
 List _company=[];

List get detail_name=>_name;
List get detail_email=>_email;
List get detail_phone=>_phone;
List get detail_company => _company;

  void Users(String name,String email,String phone,String company) {

      final u_name=_name.contains(name);
      final u_email=_email.contains(email);
      final u_phone=_phone.contains(phone);
      final u_company=company.contains(company);

      notifyListeners();
    }

  }
