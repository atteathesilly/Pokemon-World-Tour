BattleHandlers::UserAbilityStartOfMove.add(:DISCOLIGHTS,
  proc { |ability, user, targets, move, battle|
    moveUseTypeChangeAbility(ability, user, move, battle, true) if move.danceMove?
  }
)
#===============================================================================
# Custom Ability #4 - Arid Recovery : Restore 1/8 HP under Sunlight or Sandstorm
#===============================================================================

BattleHandlers::EORWeatherAbility.add(:ARIDRECOVERY,
    proc { |ability, _weather, battler, battle|
        if battle.sandy?
            healingMessage = _INTL("{1} incorporates sand into its body.", battler.pbThis)
            battler.applyFractionalHealing(WEATHER_ABILITY_HEALING_FRACTION, ability: ability, customMessage: healingMessage)
        end
  
        if battle.sunny?
            healingMessage = _INTL("{1} soaks up the heat.", battler.pbThis)
            battler.applyFractionalHealing(WEATHER_ABILITY_HEALING_FRACTION, ability: ability, customMessage: healingMessage)
        end
    }
  )

#===============================================================================
# Custom Ability #5 - Quicksand Trap : Reduce other pokemon's speed by 1 step at the end of each turn
#===============================================================================

BattleHandlers::EOREffectAbility.add(:QUICKSANDTRAP,
  proc { |ability, battler, battle|
      battler.eachOther do |b|
      b.tryLowerStat(:SPEED, battler, ability: ability)
    end
  }

)