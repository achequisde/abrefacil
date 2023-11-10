import 'package:abrefacil/models/api/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data.g.dart';

@riverpod
class UserData extends _$UserData {
  @override
  User build(User user) {
    return user;
  }
}
