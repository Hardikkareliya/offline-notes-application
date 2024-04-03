// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllNotesState {
  List<NoteModel> get noteList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllNotesStateCopyWith<AllNotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllNotesStateCopyWith<$Res> {
  factory $AllNotesStateCopyWith(
          AllNotesState value, $Res Function(AllNotesState) then) =
      _$AllNotesStateCopyWithImpl<$Res, AllNotesState>;
  @useResult
  $Res call({List<NoteModel> noteList});
}

/// @nodoc
class _$AllNotesStateCopyWithImpl<$Res, $Val extends AllNotesState>
    implements $AllNotesStateCopyWith<$Res> {
  _$AllNotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteList = null,
  }) {
    return _then(_value.copyWith(
      noteList: null == noteList
          ? _value.noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllNotesStateImplCopyWith<$Res>
    implements $AllNotesStateCopyWith<$Res> {
  factory _$$AllNotesStateImplCopyWith(
          _$AllNotesStateImpl value, $Res Function(_$AllNotesStateImpl) then) =
      __$$AllNotesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NoteModel> noteList});
}

/// @nodoc
class __$$AllNotesStateImplCopyWithImpl<$Res>
    extends _$AllNotesStateCopyWithImpl<$Res, _$AllNotesStateImpl>
    implements _$$AllNotesStateImplCopyWith<$Res> {
  __$$AllNotesStateImplCopyWithImpl(
      _$AllNotesStateImpl _value, $Res Function(_$AllNotesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteList = null,
  }) {
    return _then(_$AllNotesStateImpl(
      noteList: null == noteList
          ? _value._noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
    ));
  }
}

/// @nodoc

class _$AllNotesStateImpl implements _AllNotesState {
  const _$AllNotesStateImpl({final List<NoteModel> noteList = const []})
      : _noteList = noteList;

  final List<NoteModel> _noteList;
  @override
  @JsonKey()
  List<NoteModel> get noteList {
    if (_noteList is EqualUnmodifiableListView) return _noteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteList);
  }

  @override
  String toString() {
    return 'AllNotesState(noteList: $noteList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllNotesStateImpl &&
            const DeepCollectionEquality().equals(other._noteList, _noteList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_noteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllNotesStateImplCopyWith<_$AllNotesStateImpl> get copyWith =>
      __$$AllNotesStateImplCopyWithImpl<_$AllNotesStateImpl>(this, _$identity);
}

abstract class _AllNotesState implements AllNotesState {
  const factory _AllNotesState({final List<NoteModel> noteList}) =
      _$AllNotesStateImpl;

  @override
  List<NoteModel> get noteList;
  @override
  @JsonKey(ignore: true)
  _$$AllNotesStateImplCopyWith<_$AllNotesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
