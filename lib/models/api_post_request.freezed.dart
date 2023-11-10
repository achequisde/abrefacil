// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiPostRequest _$ApiPostRequestFromJson(Map<String, dynamic> json) {
  return _ApiPostRequest.fromJson(json);
}

/// @nodoc
mixin _$ApiPostRequest {
  String get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'msg')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiPostRequestCopyWith<ApiPostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiPostRequestCopyWith<$Res> {
  factory $ApiPostRequestCopyWith(
          ApiPostRequest value, $Res Function(ApiPostRequest) then) =
      _$ApiPostRequestCopyWithImpl<$Res, ApiPostRequest>;
  @useResult
  $Res call({String topic, @JsonKey(name: 'msg') String message});
}

/// @nodoc
class _$ApiPostRequestCopyWithImpl<$Res, $Val extends ApiPostRequest>
    implements $ApiPostRequestCopyWith<$Res> {
  _$ApiPostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiPostRequestImplCopyWith<$Res>
    implements $ApiPostRequestCopyWith<$Res> {
  factory _$$ApiPostRequestImplCopyWith(_$ApiPostRequestImpl value,
          $Res Function(_$ApiPostRequestImpl) then) =
      __$$ApiPostRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, @JsonKey(name: 'msg') String message});
}

/// @nodoc
class __$$ApiPostRequestImplCopyWithImpl<$Res>
    extends _$ApiPostRequestCopyWithImpl<$Res, _$ApiPostRequestImpl>
    implements _$$ApiPostRequestImplCopyWith<$Res> {
  __$$ApiPostRequestImplCopyWithImpl(
      _$ApiPostRequestImpl _value, $Res Function(_$ApiPostRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? message = null,
  }) {
    return _then(_$ApiPostRequestImpl(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiPostRequestImpl implements _ApiPostRequest {
  const _$ApiPostRequestImpl(
      {required this.topic, @JsonKey(name: 'msg') required this.message});

  factory _$ApiPostRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiPostRequestImplFromJson(json);

  @override
  final String topic;
  @override
  @JsonKey(name: 'msg')
  final String message;

  @override
  String toString() {
    return 'ApiPostRequest(topic: $topic, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiPostRequestImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiPostRequestImplCopyWith<_$ApiPostRequestImpl> get copyWith =>
      __$$ApiPostRequestImplCopyWithImpl<_$ApiPostRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiPostRequestImplToJson(
      this,
    );
  }
}

abstract class _ApiPostRequest implements ApiPostRequest {
  const factory _ApiPostRequest(
          {required final String topic,
          @JsonKey(name: 'msg') required final String message}) =
      _$ApiPostRequestImpl;

  factory _ApiPostRequest.fromJson(Map<String, dynamic> json) =
      _$ApiPostRequestImpl.fromJson;

  @override
  String get topic;
  @override
  @JsonKey(name: 'msg')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiPostRequestImplCopyWith<_$ApiPostRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
