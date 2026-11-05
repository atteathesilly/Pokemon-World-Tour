class PokeBattle_Move_ChangeTypeDependsOnCategory < PokeBattle_Move
    def pbBaseType(_user)
        ret = :NORMAL
        if physicalMove?
            ret = :FAIRY if GameData::Type.exists?(:FAIRY)
        else
            ret = :FIGHTING if GameData::Type.exists?(:FIGHTING)
        end 
        return ret
    end 
end 