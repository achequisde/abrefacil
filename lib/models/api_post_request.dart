import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_post_request.freezed.dart';
part 'api_post_request.g.dart';

@freezed
class ApiPostRequest with _$ApiPostRequest {
  const factory ApiPostRequest({
    required String topic,
    @JsonKey(name: 'msg') required String message,
  }) = _ApiPostRequest;

  factory ApiPostRequest.fromJson(Map<String, Object?> json) =>
      _$ApiPostRequestFromJson(json);
}
