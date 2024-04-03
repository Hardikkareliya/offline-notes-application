// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateNotesState {
  TextEditingController get titleEditingController =>
      throw _privateConstructorUsedError;
  TextEditingController get noteEditingController =>
      throw _privateConstructorUsedError;
  NoteModel? get noteData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNotesStateCopyWith<CreateNotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNotesStateCopyWith<$Res> {
  factory $CreateNotesStateCopyWith(
          CreateNotesState value, $Res Function(CreateNotesState) then) =
      _$CreateNotesStateCopyWithImpl<$Res, CreateNotesState>;
  @useResult
  $Res call(
      {TextEditingController titleEditingController,
      TextEditingController noteEditingController,
      NoteModel? noteData});
}

/// @nodoc
class _$CreateNotesStateCopyWithImpl<$Res, $Val extends CreateNotesState>
    implements $CreateNotesStateCopyWith<$Res> {
  _$CreateNotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleEditingController = null,
    Object? noteEditingController = null,
    Object? noteData = freezed,
  }) {
    return _then(_value.copyWith(
      titleEditingController: null == titleEditingController
          ? _value.titleEditingController
          : titleEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noteEditingController: null == noteEditingController
          ? _value.noteEditingController
          : noteEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noteData: freezed == noteData
          ? _value.noteData
          : noteData // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNotesStateImplCopyWith<$Res>
    implements $CreateNotesStateCopyWith<$Res> {
  factory _$$CreateNotesStateImplCopyWith(_$CreateNotesStateImpl value,
          $Res Function(_$CreateNotesStateImpl) then) =
      __$$CreateNotesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController titleEditingController,
      TextEditingController noteEditingController,
      NoteModel? noteData});
}

/// @nodoc
class __$$CreateNotesStateImplCopyWithImpl<$Res>
    extends _$CreateNotesStateCopyWithImpl<$Res, _$CreateNotesStateImpl>
    implements _$$CreateNotesStateImplCopyWith<$Res> {
  __$$CreateNotesStateImplCopyWithImpl(_$CreateNotesStateImpl _value,
      $Res Function(_$CreateNotesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleEditingController = null,
    Object? noteEditingController = null,
    Object? noteData = freezed,
  }) {
    return _then(_$CreateNotesStateImpl(
      titleEditingController: null == titleEditingController
          ? _value.titleEditingController
          : titleEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noteEditingController: null == noteEditingController
          ? _value.noteEditingController
          : noteEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      noteData: freezed == noteData
          ? _value.noteData
          : noteData // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
    ));
  }
}

/// @nodoc

class _$CreateNotesStateImpl implements _CreateNotesState {
  const _$CreateNotesStateImpl(
      {required this.titleEditingController,
      required this.noteEditingController,
      this.noteData});

  @override
  final TextEditingController titleEditingController;
  @override
  final TextEditingController noteEditingController;
  @override
  final NoteModel? noteData;

  @override
  String toString() {
    return 'CreateNotesState(titleEditingController: $titleEditingController, noteEditingController: $noteEditingController, noteData: $noteData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotesStateImpl &&
            (identical(other.titleEditingController, titleEditingController) ||
                other.titleEditingController == titleEditingController) &&
            (identical(other.noteEditingController, noteEditingController) ||
                other.noteEditingController == noteEditingController) &&
            (identical(other.noteData, noteData) ||
                other.noteData == noteData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, titleEditingController, noteEditingController, noteData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotesStateImplCopyWith<_$CreateNotesStateImpl> get copyWith =>
      __$$CreateNotesStateImplCopyWithImpl<_$CreateNotesStateImpl>(
          this, _$identity);
}

abstract class _CreateNotesState implements CreateNotesState {
  const factory _CreateNotesState(
      {required final TextEditingController titleEditingController,
      required final TextEditingController noteEditingController,
      final NoteModel? noteData}) = _$CreateNotesStateImpl;

  @override
  TextEditingController get titleEditingController;
  @override
  TextEditingController get noteEditingController;
  @override
  NoteModel? get noteData;
  @override
  @JsonKey(ignore: true)
  _$$CreateNotesStateImplCopyWith<_$CreateNotesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
