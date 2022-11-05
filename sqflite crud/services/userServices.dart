import 'package:flutter_assignment/sqflite%20crud/db_helper/repository.dart';
import 'package:flutter_assignment/sqflite%20crud/model/user.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  SaveUser(User user) async{
    return await _repository.insertData('users', user.userMap());
  }

  readAllUsers() async{
    return await _repository.readData('users');
  }
  UpdateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }

}