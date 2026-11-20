

#===============================================================================
# Doubles speed while using punching moves (Rocket Hands)
#===============================================================================

BattleHandlers::AbilityOnSwitchIn.add(:ROCKETHANDS,
  proc { |ability, battler, battle, aiCheck|
      next 0 if aiCheck
      battle.pbShowAbilitySplash(battler, ability)
      battle.pbDisplay(_INTL("{1} is preparing its rocket hands!", battler.pbThis))
      battle.pbHideAbilitySplash(battler)
  }
)

BattleHandlers::MoveSpeedModifierAbility.add(:ROCKETHANDS,
    proc { |ability, battler, move, battle, mult, aiCheck|
        next unless (aiCheck && move.nil?) || move.punchingMove?
        if aiCheck
            next mult * 2.0
        else
            battler.applyEffect(:MoveSpeedDoubled,ability)
        end
    }
)

BattleHandlers::SpeedCalcAbility.add(:ROCKETHANDS,
    proc { |ability, battler, mult|
        next unless battler.effectActive?(:MoveSpeedDoubled)
        next mult * 2 if battler.effects[:MoveSpeedDoubled] == ability
    }
)

#===============================================================================
# Heals 1/8th of its HP and takes 35% less damage in sun (Solar Panel)
#===============================================================================

BattleHandlers::EORWeatherAbility.add(:SOLARPANEL,
    proc { |ability, _weather, battler, battle|
        next unless battle.sunny?
        healingMessage = _INTL("{1} absorbs the sunlight.", battler.pbThis)
        battler.applyFractionalHealing(WEATHER_ABILITY_HEALING_FRACTION, ability: ability, customMessage: healingMessage)
    }
)

BattleHandlers::DamageCalcTargetAbility.add(:SOLARPANEL,
  proc { |ability, user, target, _move, mults, _baseDmg, type, aiCheck|
    if user.battle.sunny?
      mults[:final_damage_multiplier] *= 0.65
      target.aiLearnsAbility(ability) unless aiCheck
    end
  }
)

#===============================================================================
# Charges once per switch-in in sandstorm (Thunderstorm)
# Bug immunity + raises speed if hit by one (Impenetrable Shell)
#===============================================================================

BattleHandlers::UserAbilityEndOfMove.add(:THUNDERSTORM,
  proc { |ability, user, _targets, move, battle, _switchedBattlers|
      next if battle.futureSight
      next unless battle.sandy?
      next if user.effectActive?(:Thunderstorm)
      next if user.effectActive?(:Charge)
      battle.pbShowAbilitySplash(user, ability)
      user.applyEffect(:Charge)
      user.applyEffect(:Thunderstorm)
      battle.pbHideAbilitySplash(user)
  }
)

BattleHandlers::MoveImmunityTargetAbility.add(:HOTFIX,
  proc { |ability, user, target, move, type, battle, showMessages, aiCheck|
      next pbBattleMoveImmunityStatAbility(ability, user, target, move, type, :BUG, :SPEED, 1, battle, showMessages, aiCheck)
  }
)

#================================================================================================
# Takes 15% more damage, loses 1/10th of its HP each turn but can hold two items (Well-Equippeed)
#================================================================================================

BattleHandlers::DamageCalcTargetAbility.add(:WELLEQUIPPED,
  proc { |ability, user, target, _move, mults, _baseDmg, type, aiCheck|
      mults[:final_damage_multiplier] *= 1.15
      target.aiLearnsAbility(ability) unless aiCheck
  }
)

BattleHandlers::EOREffectAbility.add(:WELLEQUIPPED,
  proc { |ability, battler, battle|
      battle.pbShowAbilitySplash(battler, ability)
      battler.applyFractionalDamage(EOR_SELF_HARM_ABILITY_DAMAGE_FRACTION)
      battle.pbHideAbilitySplash(battler)
  }
)


#==================================================================================================
# On switch-in, +1 to attacking stats in rain, or -2 to the enemy side in moonglow (Quark Protocol)
#===================================================================================================
 
BattleHandlers::AbilityOnSwitchIn.add(:QUARKPROTOCOL,
  proc { |ability, battler, battle, aiCheck|
      if battle.rainy?
      if aiCheck
          next getMultiStatUpEffectScore([:ATTACK, 1], battler, battler)
      else
          battler.tryRaiseStat(:ATTACK, battler, ability: ability)
      if battle.moonGlowing?
      next entryDebuffAbility(ability, battler, battle, ATTACKING_STATS_2, aiCheck: aiCheck)
      end
    end 
      elsif battle.moonGlowing?
      next entryDebuffAbility(ability, battler, battle, ATTACKING_STATS_2, aiCheck: aiCheck) 
      end   
    }
)


#=====================================================================================
# Sets Brilliant Rain in switch-in, a combination of Rain and Moonglow (Hadron System)
#=====================================================================================

BattleHandlers::AbilityOnSwitchIn.add(:HADRONSYSTEM,
  proc { |ability, battler, battle, aiCheck|
      pbBattleWeatherAbility(ability, :BrilliantRain, battler, battle, true, true, aiCheck)
  }
)