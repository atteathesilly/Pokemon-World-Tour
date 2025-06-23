SaveData.register_conversion(:quest_log_3_3_0) do
  game_version '3.3.0'
  display_title 'Adding quest log data 3.3.0'
  to_all do |save_data|
      globalSwitches = save_data[:switches]
      globalVariables = save_data[:variables]
      selfSwitches = save_data[:self_switches]
      itemBag = save_data[:bag]

      questLog = save_data[:global_metadata].quests

      questLog.advanceQuest(:QUEST_HIDE_AND_SEEK) if selfSwitches[[136,30, 'A']]
      questLog.advanceQuest(:QUEST_HIDE_AND_SEEK) if selfSwitches[[24,10, 'B']]
      questLog.advanceQuest(:QUEST_HIDE_AND_SEEK) if selfSwitches[[30,26, 'B']]

      # NPC Side Quests
      questLog.advanceQuest(:QUEST_IMOGENE) if globalVariables[IMOGENE_STAGE_VAR] > 1
      questLog.advanceQuest(:QUEST_ALESSA) if selfSwitches[[56,56, 'A']] || globalVariables[ALESSA_STAGE_VAR] > 1
      questLog.advanceQuest(:QUEST_SKYLER) if globalVariables[SKYLER_STAGE_VAR] > 1
      questLog.advanceQuest(:QUEST_KEONI) if selfSwitches[[20,81, 'A']]
      questLog.advanceQuest(:QUEST_EIFION) if selfSwitches[[40,5,EIFION_STAGE_VAR]]
      questLog.advanceQuest(:QUEST_CANDY) if globalVariables[CANDY_STAGE_VAR] > 1
      
      # Fail major NPC quests if entered helix before completing
      if globalSwitches[RECURRING_QUEST_FAILURE_SWITCH]
          # TODO: only fail if not completed? unsure if automatically handled
          questLog.failQuest(:QUEST_IMOGENE)
          questLog.failQuest(:QUEST_ALESSA)
          questLog.failQuest(:QUEST_SKYLER)
          questLog.failQuest(:QUEST_KEONI)
          questLog.failQuest(:QUEST_EIFION)
          questLog.failQuest(:QUEST_CANDY)
      end
      
      # Gym avatar quests

      # Legendary Quests

      questLog.advanceQuest(:QUEST_LEGEND_CONDENSED) if itemBag.pbHasItem?(:CONDENSEDLIGHT)
      questLog.advanceQuest(:QUEST_LEGEND_CELEBI) if selfSwitches[[370,19, 'B']]
      questLog.advanceQuest(:QUEST_LEGEND_HOOPA) if selfSwitches[[379,71, 'A']]
      questLog.advanceQuest(:QUEST_LEGEND_HOOPA) if selfSwitches[[378,31, 'A']]
      questLog.advanceQuest(:QUEST_LEGEND_HOOPA) if selfSwitches[[403,1, 'A']]
      questLog.advanceQuest(:QUEST_LEGEND_MARSHADOW) if selfSwitches[[361,27, 'A']]
      questLog.advanceQuest(:QUEST_LEGEND_MARSHADOW) if selfSwitches[[362,53, 'B']]
      questLog.advanceQuest(:QUEST_LEGEND_MARSHADOW) if selfSwitches[[362,20, 'B']]
      # The commented out ones didn't work
      #questLog.advanceQuest(:QUEST_LEGEND_MELTAN) if selfSwitches[[20,103, 'A']]
      #questLog.advanceQuest(:QUEST_LEGEND_NULL) if selfSwitches[[228,1, 'A']]
      #questLog.advanceQuest(:QUEST_LEGEND_EVENTIDE) if selfSwitches[[265,3, 'B']]
      #questLog.advanceQuest(:QUEST_LEGEND_EVENTIDE) if selfSwitches[[269,1, 'B']]
      #questLog.advanceQuest(:QUEST_LEGEND_EVENTIDE) if selfSwitches[[414,6, 'A']]
      #questLog.advanceQuest(:QUEST_LEGEND_ATOLL) if selfSwitches[[165,33, 'D']]
      #questLog.advanceQuest(:QUEST_LEGEND_DRAGON_ISLE) if selfSwitches[[251,1, 'A']]
      #questLog.advanceQuest(:QUEST_LEGEND_DRAGON_ISLE) if selfSwitches[[251,1, 'B']]

      # Former Champions

      #questLog.advanceQuest(:QUEST_FORMER_ANSEL) if selfSwitches[[34,41, 'A']]
      #questLog.advanceQuest(:QUEST_FORMER_PRAVEEN) if selfSwitches[[34,41, 'D']]
      #questLog.advanceQuest(:QUEST_FORMER_PRAVEEN) if selfSwitches[[316,5, 'D']]
      #questLog.advanceQuest(:QUEST_FORMER_CHARA) if selfSwitches[[316,5, 'B']]
      #questLog.advanceQuest(:QUEST_FORMER_ELISE) if selfSwitches[[188,20, 'B']]
      #questLog.advanceQuest(:QUEST_FORMER_VINCENT) if selfSwitches[[188,20, 'C']]
      #questLog.advanceQuest(:QUEST_FORMER_CASEY) if selfSwitches[[270,3, 'A']]

      # Misc quests

      questLog.advanceQuest(:QUEST_LOST_GROWLITHE) if selfSwitches[[32,14, 'A']]
      questLog.advanceQuest(:QUEST_LOST_GROWLITHE) if globalSwitches[112]
      questLog.advanceQuest(:QUEST_DIGIT_SLIPS) if selfSwitches[[397,5, 'A']]
      questLog.advanceQuest(:QUEST_DIGIT_SLIPS) if selfSwitches[[397,5, 'B']]
      questLog.advanceQuest(:QUEST_POKEMON_MASTER) if selfSwitches[[17,4, 'A']]
      questLog.advanceQuest(:QUEST_POKEMON_MASTER) if selfSwitches[[18,2, 'B']]
      questLog.advanceQuest(:QUEST_SUS_PACKAGE) if selfSwitches[[59,18, 'A']]
      questLog.advanceQuest(:QUEST_SUS_PACKAGE) if itemBag.pbHasItem?(:WEIRDPACKAGE)
      questLog.advanceQuest(:QUEST_MEMORY_LANE) if selfSwitches[[80,1, 'A']]
      questLog.advanceQuest(:QUEST_AGRAVELER) if selfSwitches[[4,6, 'A']]
      questLog.advanceQuest(:QUEST_ABSOLUS) if selfSwitches[[66,2, 'A']]
      questLog.advanceQuest(:QUEST_AEGIS_FRAUD) if selfSwitches[[155,11, 'A']]
      questLog.advanceQuest(:QUEST_AEGIS_FRAUD) if selfSwitches[[171,2, 'A']]
      questLog.advanceQuest(:QUEST_AEGIS_FRAUD) if selfSwitches[[155,11, 'D']]
      questLog.advanceQuest(:QUEST_MALASADAS) if selfSwitches[[122,29, 'A']]
      questLog.advanceQuest(:QUEST_NOVO_WREATHS) if selfSwitches[[56,8, 'A']]
      #questLog.advanceQuest(:QUEST_NOVO_WREATHS) if selfSwitches[[TBD,TBD,TBD]]
      
      # Avatar bounties (no data tracking quest start, unfortunately)
      questLog.completeQuest(:QUEST_CROBAT) if selfSwitches[[402,8,'A']]
      questLog.completeQuest(:QUEST_BEARTIC) if selfSwitches[[395,8,'A']]
      questLog.completeQuest(:QUEST_MAROMATISSE) if selfSwitches[[339,5,'A']]
      questLog.completeQuest(:QUEST_MONKES) if selfSwitches[[391,5,'A']]

      # set starting timestamps for quests
      questLog.active_quests.each do |quest|
          quest.time = Time.now;
      end
      questLog.completed_quests.each do |quest|
          quest.time = Time.now;
      end
  end
end