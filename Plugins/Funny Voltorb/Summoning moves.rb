# Summon Krabby
class PokeBattle_Move_CallMankey < PokeBattle_Move
    include EmpoweredMove

    def pbEffectGeneral(user)
        summonAvatar(user, :MANKEY, _INTL("{1} joins with an ally!", user.pbThis))
    end
end
#===============================================================================
# Summon Solosis
#===============================================================================
class PokeBattle_Move_CallSolosis < PokeBattle_Move
    include EmpoweredMove

    def pbEffectGeneral(user)
        summonAvatar(user, :SOLOSIS, _INTL("{1} joins with an ally!", user.pbThis))
    end
end
#===============================================================================
# Summon Rolycoly
#===============================================================================
class PokeBattle_Move_CallRolycoly < PokeBattle_Move
    include EmpoweredMove

    def pbEffectGeneral(user)
        summonAvatar(user, :ROLYCOLY, _INTL("{1} joins with an ally!", user.pbThis))
    end
end
#===============================================================================
# The user chooses between calling Rolycoly, Solosis and Krabby
#===============================================================================
class PokeBattle_Move_SummonStage1Helpers < PokeBattle_Move
    def callsAnotherMove?; return true; end

    def initialize(battle, move)
        super
        @validMoves = %i[
            CALLMANKEY
            CALLSOLOSIS
            CALLROLYCOLY
        ]
    end

    def resolutionChoice(user)
        validMoveNames = []
        @validMoves.each do |move|
            validMoveNames.push(getMoveName(move))
        end

        if @battle.autoTesting
            @chosenMove = @validMoves.sample
        elsif !user.pbOwnedByPlayer? # Trainer AI
            @chosenMove = @validMoves[0]
        else
            chosenIndex = @battle.scene.pbShowCommands(_INTL("Which move should {1} use?", user.pbThis(true)),validMoveNames,0)
            @chosenMove = @validMoves[chosenIndex]
        end
    end

    def pbEffectAgainstTarget(user, target)
        user.pbUseMoveSimple(@chosenMove, target.index) if @chosenMove
    end

    def resetMoveUsageState
        @chosenMove = nil
    end

    def pbShowAnimation(id, user, targets, hitNum = 0, showAnimation = true)
        return # No animation
    end
end
#===============================================================================
# Summon Ludicolo
#===============================================================================
class PokeBattle_Move_CallLudicolo < PokeBattle_Move
    include EmpoweredMove

    def pbEffectGeneral(user)
        summonAvatar(user, :LUDICOLO, _INTL("{1} joins with an ally to dance!", user.pbThis))
    end
end