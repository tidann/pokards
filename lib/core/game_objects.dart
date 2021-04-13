import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_objects.freezed.dart';

enum Street { preflop, flop, turn, river }

enum Rank {
  ace,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
}

const Map<Rank, List<RankIconPosition>> rankIconPositions = {
  Rank.ace: [RankIconPosition(0, 0)],
  Rank.two: [
    RankIconPosition(0, 0.8),
    RankIconPosition(0, -0.8),
  ],
  Rank.three: [
    RankIconPosition(0, 0.8),
    RankIconPosition(0, 0),
    RankIconPosition(0, -0.8),
  ],
  Rank.four: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, -0.8),
  ],
  Rank.five: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0, 0),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, -0.8),
  ],
  Rank.six: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, 0),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, 0),
    RankIconPosition(0.55, -0.8),
  ],
  Rank.seven: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, 0),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, 0),
    RankIconPosition(0.55, -0.8),
    RankIconPosition(0, 0.4),
  ],
  Rank.eight: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, 0.26),
    RankIconPosition(-0.55, -0.27),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, 0.26),
    RankIconPosition(0.55, -0.27),
    RankIconPosition(0.55, -0.8),
  ],
  Rank.nine: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, 0.26),
    RankIconPosition(-0.55, -0.27),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, 0.26),
    RankIconPosition(0.55, -0.27),
    RankIconPosition(0.55, -0.8),
    RankIconPosition(0, 0.58),
  ],
  Rank.ten: [
    RankIconPosition(-0.55, 0.8),
    RankIconPosition(-0.55, 0.26),
    RankIconPosition(-0.55, -0.27),
    RankIconPosition(-0.55, -0.8),
    RankIconPosition(0.55, 0.8),
    RankIconPosition(0.55, 0.26),
    RankIconPosition(0.55, -0.27),
    RankIconPosition(0.55, -0.8),
    RankIconPosition(0, 0.58),
    RankIconPosition(0, -0.58),
  ],
  Rank.jack: [
    RankIconPosition(0, 0.55),
  ],
  Rank.queen: [
    RankIconPosition(0.4, -0.5),
  ],
  Rank.king: [
    RankIconPosition(0.4, -0.5),
  ],
};

class RankIconPosition {
  final double x;
  final double y;
  final bool isReversed;

  const RankIconPosition(this.x, this.y, [this.isReversed = false]);
}

enum Suit { spade, club, diamond, heart }

@freezed
abstract class PlayingCard with _$PlayingCard {
  const factory PlayingCard({required Rank rank, required Suit suit}) =
      _PlayingCard;
}

enum DealMode { player, table }

@freezed
abstract class Role with _$Role {
  const factory Role.player({
    required int index,
    required List<PlayingCard> cards,
  }) = _Player;
  const factory Role.table() = _Table;
}

@freezed
abstract class GameProperties with _$GameProperties {
  const factory GameProperties({
    required Role role,
    required String gameId,
    required List<PlayingCard> boardCards,
  }) = _GameProperties;
}
