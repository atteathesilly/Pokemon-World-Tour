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