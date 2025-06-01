module ItemIconEvents
  ModifyItemIconFileName = HandlerHash2.new
  ModifyItemIconBitmap = HandlerHash2.new

  def self.triggerModifyItemIconFileName(item, iconName)
    ret = ModifyItemIconFileName.trigger(item, iconName)
    return ret.nil? ? iconName : ret
  end
  
  def self.triggerModifyItemIconBitmap(item, iconBitmap)
    ModifyItemIconBitmap.trigger(item, iconBitmap)
  end

  def self.item_dynamic_icon?(item)
    return ModifyItemIconFileName.hasKey?(item) || ModifyItemIconBitmap.hasKey?(item)
  end
end

##############################################
# Modify Item Icon File Name
##############################################
ItemIconEvents::ModifyItemIconFileName.add(:TAROTAMULET,
  proc { |item, iconName|
      iconName += "_ACTIVE" if tarotAmuletActive?    
      next iconName
  }
)

ItemIconEvents::ModifyItemIconFileName.add(:CELLBOOSTER,
  proc { |item, iconName|
      iconName += "_INACTIVE" if cellBoosterInactive?    
      next iconName
  }
)

##############################################
# Modify Item Icon Bitmap
##############################################
ItemIconEvents::ModifyItemIconBitmap.add(:AIDKIT,
  proc { |item, bitmap|
      base = Color.new(235, 235, 235)
      shadow = Color.new(50, 50, 50)
      currentUses = $PokemonGlobal.teamHealerCurrentUses
      if currentUses
        textPos = [currentUses.to_s, 36, 14, 1, base, shadow, true]
        pbDrawTextPositions(bitmap,[textPos])
      end
  }
)