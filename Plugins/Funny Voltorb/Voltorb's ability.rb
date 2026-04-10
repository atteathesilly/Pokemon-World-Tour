BattleHandlers::UserAbilityStartOfMove.add(:DISCOLIGHTS,
  proc { |ability, user, targets, move, battle|
    moveUseTypeChangeAbility(ability, user, move, battle, true) if move.danceMove?
  }
)

BattleHandlers::UserAbilityStartOfMove.add(:SHARPERANDSMARTER,
  proc { |ability, user, targets, move, battle|
    moveUseTypeChangeAbility(ability, user, move, battle, true) if move.fieldMove?
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
#===============================================================================
# Spicy Extract
#===============================================================================
# Increases the target's Attack by 2 stages.
# Decreases the target's Defense by 4 stages.
#-------------------------------------------------------------------------------
class PokeBattle_Move_RaiseTargetAtk2LowerTargetDef4 < PokeBattle_Move
    attr_reader :statUp, :statDown
    def canMagicCoat?; return true; end
  
    def initialize(battle, move)
      super
      @statUp   = [:ATTACK, 2]
      @statDown = [:DEFENDING_STATS_4]
    end
  
    def pbFailsAgainstTarget?(user, target, show_message)
      return false if damagingMove?
      failed = !target.pbCanRaiseStatStage?(@statUp[0], user, self) && 
               !target.pbCanLowerStatStage?(@statDown[0], user, self)
      if failed
        @battle.pbDisplay(_INTL("{1}'s stats can't be changed further!", target.pbThis)) if show_message
        return true
      end
      return false
    end
  
    def pbEffectAgainstTarget(user, target)
      return if damagingMove?
      if target.pbCanRaiseStatStage?(@statUp[0], user, self)
        target.pbRaiseStatStage(@statUp[0], @statUp[1], user)
      end
      if target.pbCanLowerStatStage?(@statDown[0], user, self)
        target.pbLowerStatStage(@statDown[0], @statDown[1], user)
      end
    end
  end
#===============================================================================
# 100% Accuracy in Sunshine, and always causes a burn
# (Pepper Headbutt)
#===============================================================================
class PokeBattle_Move_SunshineAccurateCauseBurn < PokeBattle_BurnMove
    def pbAdditionalEffect(user, target)
        return unless @battle.sunny?
        super
    end

    def getTargetAffectingEffectScore(user, target)
        return 0 unless @battle.sunny?
        super
    end

    def pbBaseAccuracy(user, target)
        return 0 if @battle.sunny?
        return super
    end

    def shouldHighlight?(_user, _target)
        return @battle.sunny?
    end 
end    
#===============================================================================
# Custom Ability #22 - Draconic Heat: Is also dragon-type but loses 1-8th HP every turn
#===============================================================================
BattleHandlers::TypeCalcAbility.add(:DRACONICHEAT,
    proc { |ability, battler, types|
        types.push(:DRAGON)
        next types
    }
)

BattleHandlers::EOREffectAbility.copy(:EXTREMEPOWER,:DRACONICHEAT)