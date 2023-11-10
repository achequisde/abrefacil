import 'package:freezed_annotation/freezed_annotation.dart';

part 'condo.freezed.dart';
part 'condo.g.dart';

@freezed
class Condo with _$Condo {
  const factory Condo({
    required int id,
    required String name,
    required int limit,
    required bool enabled,
  }) = _Condo;

  factory Condo.fromJson(Map<String, Object?> json) => _$CondoFromJson(json);
}
