// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataHash() => r'ff5ebe51c9c9e1a97ec7150b47cd254f5af4bcb3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserData extends BuildlessAutoDisposeNotifier<User> {
  late final User user;

  User build(
    User user,
  );
}

/// See also [UserData].
@ProviderFor(UserData)
const userDataProvider = UserDataFamily();

/// See also [UserData].
class UserDataFamily extends Family<User> {
  /// See also [UserData].
  const UserDataFamily();

  /// See also [UserData].
  UserDataProvider call(
    User user,
  ) {
    return UserDataProvider(
      user,
    );
  }

  @override
  UserDataProvider getProviderOverride(
    covariant UserDataProvider provider,
  ) {
    return call(
      provider.user,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userDataProvider';
}

/// See also [UserData].
class UserDataProvider extends AutoDisposeNotifierProviderImpl<UserData, User> {
  /// See also [UserData].
  UserDataProvider(
    User user,
  ) : this._internal(
          () => UserData()..user = user,
          from: userDataProvider,
          name: r'userDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDataHash,
          dependencies: UserDataFamily._dependencies,
          allTransitiveDependencies: UserDataFamily._allTransitiveDependencies,
          user: user,
        );

  UserDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final User user;

  @override
  User runNotifierBuild(
    covariant UserData notifier,
  ) {
    return notifier.build(
      user,
    );
  }

  @override
  Override overrideWith(UserData Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserDataProvider._internal(
        () => create()..user = user,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UserData, User> createElement() {
    return _UserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDataProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserDataRef on AutoDisposeNotifierProviderRef<User> {
  /// The parameter `user` of this provider.
  User get user;
}

class _UserDataProviderElement
    extends AutoDisposeNotifierProviderElement<UserData, User>
    with UserDataRef {
  _UserDataProviderElement(super.provider);

  @override
  User get user => (origin as UserDataProvider).user;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
