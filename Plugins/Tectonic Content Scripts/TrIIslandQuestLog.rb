# Ends the QUEST_LEGEND_TRI_ISLAND quest when the player obtains all 3 birds

def completeTriIslandQuest
  if pbGetSelfSwitch(001, 'A', 416) && pbGetSelfSwitch(001, 'A', 417) && pbGetSelfSwitch(001, 'A', 415)
      completeQuest(:QUEST_LEGEND_TRI_ISLAND)
  end
end