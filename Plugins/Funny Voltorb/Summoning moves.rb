#===============================================================================
# Summons a boss Pokémon in an empty side slot.
#===============================================================================
class PokeBattle_Move_SummonHelper < PokeBattle_Move
    include EmpoweredMove

    def pbMoveFailed?(user, _targets, show_message)
        if user.battle.pbSideSize(user.index) >= 3
            @battle.pbDisplay(_INTL("But it failed, since {1}'s side is full!", user.pbThis(true))) if show_message
            return true
        end
        return false
    end

    def initialize(battle, move)
        super
        @allySummoned = nil
    end

    def pbEffectGeneral(user)
        summonAvatar(user, @allySummoned, _INTL("An allied {1} joins the field!", @allySummoned.to_s.capitalize)) unless @allySummoned.nil?
    end

    def resetMoveUsageState
        @allySummoned = nil
    end
end

#===============================================================================
# Summons an ally between Mankey, Solosis and Rolycoly (Call Helper)
#===============================================================================
class PokeBattle_Move_SummonStage1Helpers < PokeBattle_Move_SummonHelper
    def initialize(battle, move)
        super
        @validAllies = %i[
            MANKEY
            SOLOSIS
            ROLYCOLY
        ]
    end

    def resolutionChoice(user)
        if pbMoveFailed?(user, nil, false)
            @allySummoned = nil
        elsif @battle.autoTesting
            @allySummoned = @validAllies.sample
        elsif !user.pbOwnedByPlayer? # Trainer AI
            @allySummoned = @validAllies[0]
        else
            chosenIndex = @battle.scene.pbShowCommands(_INTL("Which ally should {1} call?", user.pbThis(true)),@validAllies.map { |sym| sym.to_s.capitalize }, 0)
            @allySummoned = @validAllies[chosenIndex]
        end
    end
end
#===============================================================================
# Summons Ludicolo
#===============================================================================
class PokeBattle_Move_CallLudicolo < PokeBattle_Move_SummonHelper
    def initialize
        super
        @allySummoned = :LUDICOLO
    end

end