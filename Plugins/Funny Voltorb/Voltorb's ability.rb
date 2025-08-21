BattleHandlers::UserAbilityStartOfMove.add(:DISCOLIGHTS,
  proc { |ability, user, targets, move, battle|
    moveUseTypeChangeAbility(ability, user, move, battle, true) if move.danceMove?
  }
)