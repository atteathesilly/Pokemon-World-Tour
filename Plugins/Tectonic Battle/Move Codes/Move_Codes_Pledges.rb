
#===============================================================================
# Combos with another Pledge move used by the ally. (Grass Pledge)
# If the move is a combo, power is doubled and causes either a sea of fire or a
# swamp on the opposing side.
#===============================================================================
class PokeBattle_Move_GrassPledge < PokeBattle_PledgeMove
    def initialize(battle, move)
        super
        # [Function code to combo with, effect, override type, override animation]
        @combos = [["FirePledge", :SeaOfFire, :FIRE, :FIREPLEDGE],
                   ["WaterPledge", :Swamp,     nil,   nil],]
    end
end

#===============================================================================
# Combos with another Pledge move used by the ally. (Fire Pledge)
# If the move is a combo, power is doubled and causes either a rainbow on the
# user's side or a sea of fire on the opposing side.
#===============================================================================
class PokeBattle_Move_FirePledge < PokeBattle_PledgeMove
    def initialize(battle, move)
        super
        # [Function code to combo with, effect, override type, override animation]
        @combos = [["WaterPledge", :Rainbow,   :WATER, :WATERPLEDGE],
                   ["GrassPledge", :SeaOfFire, nil,    nil],]
    end
end

#===============================================================================
# Combos with another Pledge move used by the ally. (Water Pledge)
# If the move is a combo, power is doubled and causes either a swamp on the
# opposing side or a rainbow on the user's side.
#===============================================================================
class PokeBattle_Move_WaterPledge < PokeBattle_PledgeMove
    def initialize(battle, move)
        super
        # [Function code to combo with, effect, override type, override animation]
        @combos = [["GrassPledge", :Swamp,   :GRASS, :GRASSPLEDGE],
                   ["FirePledge", :Rainbow, nil,    nil],]
    end
end

#===============================================================================
# Summoning rainbow (rainbow connection)
#===============================================================================
class PokeBattle_Move_SummonRainbow < PokeBattle_Move
     def pbEffectGeneral(user)
        unless user.pbOpposingSide.effectActive?(:Rainbow)
            user.pbOpposingSide.applyEffect(:Rainbow, 4)
        end
    end
end

#===============================================================================
# Summoning swamp (Swamped)
#===============================================================================
class PokeBattle_Move_SummonSwamp < PokeBattle_Move
     def pbEffectGeneral(user)
        unless user.pbOpposingSide.effectActive?(:Swamp)
             user.pbOpposingSide.applyEffect(:Swamp, 4)
        end
    end
end

#===============================================================================
# Summoning sea of fire (Sea of Fire)
#===============================================================================
class PokeBattle_Move_SummonSeaofFire < PokeBattle_Move
     def pbEffectGeneral(user)
        unless user.pbOpposingSide.effectActive?(:SeaOfFire)
             user.pbOpposingSide.applyEffect(:SeaOfFire, 4)
        end
    end
end