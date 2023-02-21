import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository);

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  Future<void> fetchUsers() async {
    _users = await _userRepository.getUsers();
    notifyListeners();
  }
}
