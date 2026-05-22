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
      failed = !target.pbCanRaiseStatStep?(@statUp[0], user, self) && 
               !target.pbCanLowerStatStep?(@statDown[0], user, self)
      if failed
        @battle.pbDisplay(_INTL("{1}'s stats can't be changed further!", target.pbThis)) if show_message
        return true
      end
      return false
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

BattleHandlers::AbilityOnSwitchOut.add(:ZEROTOHERO,
  proc { |ability, battler, battle, endOfBattle|
      next if endOfBattle
      next unless battler.species == :PALAFIN
      next unless battler.form == 0
      battler.pbChangeForm(1, battler.pbThis)
  }
)

BattleHandlers::AbilityOnSwitchIn.add(:ZEROTOHERO,
  proc { |ability, battler, battle, aiCheck|
      next 0 if aiCheck
      next unless battler.form == 1
      battle.pbShowAbilitySplash(battler, ability)
      battle.pbDisplay(_INTL("{1} underwent a heroic transformation!", battler.pbThis))
      battle.pbHideAbilitySplash(battler)
  }
)

BattleHandlers::AbilityOnSwitchOut.add(:SIDECHARACTER,
  proc { |ability, battler, battle, endOfBattle|
      next if endOfBattle
      battler.position.applyEffect(:SideCharacter, battler.pokemonIndex)
  }
)

GameData::BattleEffect.register_effect(:Position, {
    :id => :SideCharacter,
    :real_name => "Side Character",
    :type => :PartyPosition,
    :swaps_with_battlers => true,
    :entry_proc => proc do |battle, _index, position, battler|
        sourceMaker = battle.pbThisEx(battler.index, position.effects[:SideCharacter])
        battle.pbDisplay(_INTL("{1}'s cheers boost the morale!", sourceMaker, battler.pbThis(true)))
        battler.pbRaiseMultipleStatSteps(ATTACKING_STATS_1, battler, showFailMsg: true)
        position.disableEffect(:SideCharacter)
    end,
})
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

#===============================================================================
# User turns 1/4 of max HP into a substitute. Then, the user switches out. The
# switched-in Pokemon retains the user's substitute. (Shed Tail)
#-------------------------------------------------------------------------------
class PokeBattle_Move_UserMakeSubstituteSwitchOut < PokeBattle_Move
    def pbMoveFailed?(user, _targets, show_message)
        if user.substituted?
            @battle.pbDisplay(_INTL("{1} already has a substitute!", user.pbThis)) if show_message
            return true
        end

        if user.hp <= user.getSubLife
            if show_message
                @battle.pbDisplay(_INTL("But it failed, since #{user.pbThis(true)} does not have enough HP left to make a substitute!"))
            end
            return true
        end

       
        unless @battle.pbCanChooseNonActive?(user.index)
                if show_message
                    @battle.pbDisplay(_INTL("But it failed, since #{user.pbThis(true)} has no party allies to replace it!"))
                end
                return true
            end
            return false
      
    end

    def switchOutMove?; return true; end


    def pbEndOfMoveUsageEffect(user, _targets, numHits, switchedBattlers)
        return if user.fainted? || numHits == 0
        return unless @battle.pbCanChooseNonActive?(user.index)
        @battle.pbPursuit(user.index)
        return if user.fainted?
        newPkmn = @battle.pbGetReplacementPokemonIndex(user.index) # Owner chooses
        return if newPkmn < 0
        @battle.pbRecallAndReplace(user.index, newPkmn, false, true)
        @battle.pbClearChoice(user.index) # Replacement Pokémon does nothing this round
        @battle.moldBreaker = false
        switchedBattlers.push(user.index)
        user.pbEffectsOnSwitchIn(true)
    end
    
    def pbEffectGeneral(user)
        user.createSubstitute
        @battle.pbDisplay(_INTL("{1} shed its tail to create a decoy!", user.pbThis))
    end

    def getEffectScore(user, _target)
        score = getSubstituteEffectScore(user)
        score += getHPLossEffectScore(user, 0.25)
        return score
    end
end

#===============================================================================
# Custom Ability #10 - Vertigo Pirouette : When below half health, moves dizzy the opponent
#===============================================================================

BattleHandlers::UserAbilityOnHit.add(:VERTIGOPIROUETTE,
  proc { |ability, user, target, move, battle, aiCheck, aiNumHits|
    next unless user.belowHalfHealth?
    randomStatusProcUserAbility(ability, :DIZZY, 100, user, target, move, battle, aiCheck, aiNumHits)
  }
)
