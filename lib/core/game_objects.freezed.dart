// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayingCardTearOff {
  const _$PlayingCardTearOff();

  _PlayingCard call({required Rank rank, required Suit suit}) {
    return _PlayingCard(
      rank: rank,
      suit: suit,
    );
  }
}

/// @nodoc
const $PlayingCard = _$PlayingCardTearOff();

/// @nodoc
mixin _$PlayingCard {
  Rank get rank => throw _privateConstructorUsedError;
  Suit get suit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayingCardCopyWith<PlayingCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayingCardCopyWith<$Res> {
  factory $PlayingCardCopyWith(
          PlayingCard value, $Res Function(PlayingCard) then) =
      _$PlayingCardCopyWithImpl<$Res>;
  $Res call({Rank rank, Suit suit});
}

/// @nodoc
class _$PlayingCardCopyWithImpl<$Res> implements $PlayingCardCopyWith<$Res> {
  _$PlayingCardCopyWithImpl(this._value, this._then);

  final PlayingCard _value;
  // ignore: unused_field
  final $Res Function(PlayingCard) _then;

  @override
  $Res call({
    Object? rank = freezed,
    Object? suit = freezed,
  }) {
    return _then(_value.copyWith(
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank,
      suit: suit == freezed
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suit,
    ));
  }
}

/// @nodoc
abstract class _$PlayingCardCopyWith<$Res>
    implements $PlayingCardCopyWith<$Res> {
  factory _$PlayingCardCopyWith(
          _PlayingCard value, $Res Function(_PlayingCard) then) =
      __$PlayingCardCopyWithImpl<$Res>;
  @override
  $Res call({Rank rank, Suit suit});
}

/// @nodoc
class __$PlayingCardCopyWithImpl<$Res> extends _$PlayingCardCopyWithImpl<$Res>
    implements _$PlayingCardCopyWith<$Res> {
  __$PlayingCardCopyWithImpl(
      _PlayingCard _value, $Res Function(_PlayingCard) _then)
      : super(_value, (v) => _then(v as _PlayingCard));

  @override
  _PlayingCard get _value => super._value as _PlayingCard;

  @override
  $Res call({
    Object? rank = freezed,
    Object? suit = freezed,
  }) {
    return _then(_PlayingCard(
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank,
      suit: suit == freezed
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suit,
    ));
  }
}

/// @nodoc
class _$_PlayingCard implements _PlayingCard {
  const _$_PlayingCard({required this.rank, required this.suit});

  @override
  final Rank rank;
  @override
  final Suit suit;

  @override
  String toString() {
    return 'PlayingCard(rank: $rank, suit: $suit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayingCard &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.suit, suit) ||
                const DeepCollectionEquality().equals(other.suit, suit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(suit);

  @JsonKey(ignore: true)
  @override
  _$PlayingCardCopyWith<_PlayingCard> get copyWith =>
      __$PlayingCardCopyWithImpl<_PlayingCard>(this, _$identity);
}

abstract class _PlayingCard implements PlayingCard {
  const factory _PlayingCard({required Rank rank, required Suit suit}) =
      _$_PlayingCard;

  @override
  Rank get rank => throw _privateConstructorUsedError;
  @override
  Suit get suit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlayingCardCopyWith<_PlayingCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RoleTearOff {
  const _$RoleTearOff();

  _Player player({required int index, required List<PlayingCard> cards}) {
    return _Player(
      index: index,
      cards: cards,
    );
  }

  _Table table() {
    return const _Table();
  }
}

/// @nodoc
const $Role = _$RoleTearOff();

/// @nodoc
mixin _$Role {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, List<PlayingCard> cards) player,
    required TResult Function() table,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, List<PlayingCard> cards)? player,
    TResult Function()? table,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Player value) player,
    required TResult Function(_Table value) table,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Player value)? player,
    TResult Function(_Table value)? table,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoleCopyWithImpl<$Res> implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  final Role _value;
  // ignore: unused_field
  final $Res Function(Role) _then;
}

/// @nodoc
abstract class _$PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  $Res call({int index, List<PlayingCard> cards});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object? index = freezed,
    Object? cards = freezed,
  }) {
    return _then(_Player(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<PlayingCard>,
    ));
  }
}

/// @nodoc
class _$_Player implements _Player {
  const _$_Player({required this.index, required this.cards});

  @override
  final int index;
  @override
  final List<PlayingCard> cards;

  @override
  String toString() {
    return 'Role.player(index: $index, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Player &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(cards);

  @JsonKey(ignore: true)
  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, List<PlayingCard> cards) player,
    required TResult Function() table,
  }) {
    return player(index, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, List<PlayingCard> cards)? player,
    TResult Function()? table,
    required TResult orElse(),
  }) {
    if (player != null) {
      return player(index, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Player value) player,
    required TResult Function(_Table value) table,
  }) {
    return player(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Player value)? player,
    TResult Function(_Table value)? table,
    required TResult orElse(),
  }) {
    if (player != null) {
      return player(this);
    }
    return orElse();
  }
}

abstract class _Player implements Role {
  const factory _Player(
      {required int index, required List<PlayingCard> cards}) = _$_Player;

  int get index => throw _privateConstructorUsedError;
  List<PlayingCard> get cards => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PlayerCopyWith<_Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TableCopyWith<$Res> {
  factory _$TableCopyWith(_Table value, $Res Function(_Table) then) =
      __$TableCopyWithImpl<$Res>;
}

/// @nodoc
class __$TableCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res>
    implements _$TableCopyWith<$Res> {
  __$TableCopyWithImpl(_Table _value, $Res Function(_Table) _then)
      : super(_value, (v) => _then(v as _Table));

  @override
  _Table get _value => super._value as _Table;
}

/// @nodoc
class _$_Table implements _Table {
  const _$_Table();

  @override
  String toString() {
    return 'Role.table()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Table);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, List<PlayingCard> cards) player,
    required TResult Function() table,
  }) {
    return table();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, List<PlayingCard> cards)? player,
    TResult Function()? table,
    required TResult orElse(),
  }) {
    if (table != null) {
      return table();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Player value) player,
    required TResult Function(_Table value) table,
  }) {
    return table(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Player value)? player,
    TResult Function(_Table value)? table,
    required TResult orElse(),
  }) {
    if (table != null) {
      return table(this);
    }
    return orElse();
  }
}

abstract class _Table implements Role {
  const factory _Table() = _$_Table;
}

/// @nodoc
class _$GamePropertiesTearOff {
  const _$GamePropertiesTearOff();

  _GameProperties call(
      {required Role role,
      required String gameId,
      required List<PlayingCard> boardCards}) {
    return _GameProperties(
      role: role,
      gameId: gameId,
      boardCards: boardCards,
    );
  }
}

/// @nodoc
const $GameProperties = _$GamePropertiesTearOff();

/// @nodoc
mixin _$GameProperties {
  Role get role => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  List<PlayingCard> get boardCards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamePropertiesCopyWith<GameProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePropertiesCopyWith<$Res> {
  factory $GamePropertiesCopyWith(
          GameProperties value, $Res Function(GameProperties) then) =
      _$GamePropertiesCopyWithImpl<$Res>;
  $Res call({Role role, String gameId, List<PlayingCard> boardCards});

  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class _$GamePropertiesCopyWithImpl<$Res>
    implements $GamePropertiesCopyWith<$Res> {
  _$GamePropertiesCopyWithImpl(this._value, this._then);

  final GameProperties _value;
  // ignore: unused_field
  final $Res Function(GameProperties) _then;

  @override
  $Res call({
    Object? role = freezed,
    Object? gameId = freezed,
    Object? boardCards = freezed,
  }) {
    return _then(_value.copyWith(
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      boardCards: boardCards == freezed
          ? _value.boardCards
          : boardCards // ignore: cast_nullable_to_non_nullable
              as List<PlayingCard>,
    ));
  }

  @override
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value));
    });
  }
}

/// @nodoc
abstract class _$GamePropertiesCopyWith<$Res>
    implements $GamePropertiesCopyWith<$Res> {
  factory _$GamePropertiesCopyWith(
          _GameProperties value, $Res Function(_GameProperties) then) =
      __$GamePropertiesCopyWithImpl<$Res>;
  @override
  $Res call({Role role, String gameId, List<PlayingCard> boardCards});

  @override
  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class __$GamePropertiesCopyWithImpl<$Res>
    extends _$GamePropertiesCopyWithImpl<$Res>
    implements _$GamePropertiesCopyWith<$Res> {
  __$GamePropertiesCopyWithImpl(
      _GameProperties _value, $Res Function(_GameProperties) _then)
      : super(_value, (v) => _then(v as _GameProperties));

  @override
  _GameProperties get _value => super._value as _GameProperties;

  @override
  $Res call({
    Object? role = freezed,
    Object? gameId = freezed,
    Object? boardCards = freezed,
  }) {
    return _then(_GameProperties(
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      boardCards: boardCards == freezed
          ? _value.boardCards
          : boardCards // ignore: cast_nullable_to_non_nullable
              as List<PlayingCard>,
    ));
  }
}

/// @nodoc
class _$_GameProperties implements _GameProperties {
  const _$_GameProperties(
      {required this.role, required this.gameId, required this.boardCards});

  @override
  final Role role;
  @override
  final String gameId;
  @override
  final List<PlayingCard> boardCards;

  @override
  String toString() {
    return 'GameProperties(role: $role, gameId: $gameId, boardCards: $boardCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameProperties &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.gameId, gameId) ||
                const DeepCollectionEquality().equals(other.gameId, gameId)) &&
            (identical(other.boardCards, boardCards) ||
                const DeepCollectionEquality()
                    .equals(other.boardCards, boardCards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(gameId) ^
      const DeepCollectionEquality().hash(boardCards);

  @JsonKey(ignore: true)
  @override
  _$GamePropertiesCopyWith<_GameProperties> get copyWith =>
      __$GamePropertiesCopyWithImpl<_GameProperties>(this, _$identity);
}

abstract class _GameProperties implements GameProperties {
  const factory _GameProperties(
      {required Role role,
      required String gameId,
      required List<PlayingCard> boardCards}) = _$_GameProperties;

  @override
  Role get role => throw _privateConstructorUsedError;
  @override
  String get gameId => throw _privateConstructorUsedError;
  @override
  List<PlayingCard> get boardCards => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GamePropertiesCopyWith<_GameProperties> get copyWith =>
      throw _privateConstructorUsedError;
}
