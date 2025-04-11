module QuestModule
  
  # Major NPC Side Quests
  
  QUEST_IMOGENE = {
    :ID => "0",
    :Name => "WIP: The Duplicate Sage",
    :Stage1 => "Find them north of Svait.",
    :Stage2 => "Find them post surf.",
    :Stage3 => "Find them back south.",
    :Stage4 => "Find them near the Lingering Delta.",
    :Location1 => "Ice Cave",
    :Location2 => "Prizca West",
    :Location3 => "Grouz",
    :Location4 => "Carnation Graves",
    :QuestDescription => "[Ask Writer for Desc].",
  }
  
  QUEST_ALESSA = {
    :ID => "1",
    :Name => "WIP: Alessa Quest",
    :Stage1 => "Find them in the sewers.",
    :Stage2 => "Find them post surf.",
    :Stage3 => "Find them back south.",
    :Stage4 => "Find them near Team Chasm HQ.",
    :Location1 => "Luxtech Sewers",
    :Location2 => "Prizca East",
    :Location3 => "Volcanic Shore",
    :Location4 => "Hollowed Layer",
    :QuestDescription => "[Ask Writer for Desc].",
  }
  
  QUEST_SKYLER = {
    :ID => "2",
    :Name => "WIP: Skyler Quest",
    :Stage1 => "Find them in Velenz.",
    :Stage2 => "Find them north east.",
    :Stage3 => "Find them back south.",
    :Stage4 => "Find them on the southern mountain.",
    :Location1 => "Velenz",
    :Location2 => "Prizca East",
    :Location3 => "Team Chasm HQ",
    :Location4 => "Kilna Ascent",
    :QuestDescription => "[Ask Writer for Desc].",
  }
  
  QUEST_KEONI = {
    :ID => "3",
    :Name => "WIP: Keoni Quest",
    :Stage1 => "Find them post surf.",
    :Stage2 => "Find them in the sewers.",
    :Stage3 => "Find them back south.",
    :Stage4 => "Find them near Velenz.",
    :Location1 => "Eleig Stretch",
    :Location2 => "Sewer Junction",
    :Location3 => "Novo College",
    :Location4 => "Velenz Menagerie",
    :QuestDescription => "[Ask Writer for Desc].",
  }
  
  QUEST_EIFION = {
    :ID => "4",
    :Name => "WIP: Eifion Quest",
    :Stage1 => "Find them near the river.",
    :Stage2 => "Find them up river.",
    :Stage3 => "Find them in the shack.",
    :Stage4 => "Find them near the lake.",
    :Location1 => "Eleig River Crossing",
    :Location2 => "Highland Lake",
    :Location3 => "Tournament Grounds",
    :Location4 => "Abyssal Cavern",
    :QuestDescription => "[Ask Writer for Desc].",
  }
  
  QUEST_CANDY = {
    :ID => "5",
    :Name => "WIP: Candy Quest",
    :Stage1 => "Enter the man's house.",
    :Stage2 => "Find them at the college.",
    :Stage3 => "Find them post surf.",
    :Stage4 => "Find them in a cave.",
    :Stage5 => "Find them at the river.",
    :Location1 => "Barren Crater",
    :Location2 => "Novo College",
    :Location3 => "Prizca West",
    :Location4 => "Cave of Hatching",
    :Location5 => "Eleig Stretch",
    :QuestDescription => "[Ask Writer for Desc].",
  }

  # Fetch/Misc Quests

  QUEST_LOST_GROWLITHE = {
    :ID => "6",
    :Name => "Lost Puppy",
    :QuestGiver => "School Kid",
    :Stage1 => "Find the Growlithe.",
    :Stage2 => "Return to the kid.",
    :Location1 => "Repora Forest",
    :Location2 => "Novo Apartments",
    :QuestDescription => "The kid in Novo Apartments is asking you to find his Growlithe, which is lost in Repora Forest.",
  }

  QUEST_HIDE_AND_SEEK = {
    :ID => "7",
    :Name => "Hide and Seek",
    :QuestGiver => "TM Kid",
    :Stage1 => "Find him.",
    :Stage2 => "Find him again.",
    :Location1 => "Casaba Island",
    :Location2 => "Casaba Island",
    :QuestDescription => "Play hide and seek with the kid who said they'd give you TMs.",
    :RewardString => "TMs!"
  }

  QUEST_DIGIT_SLIPS = {
    :ID => "8",
    :Name => "An Inconvenienced Ranger",
    :QuestGiver => "Ranger",
    :Stage1 => "Find all the digit slips.",
    :Location1 => "Menagerie-Velenz Gatehouse",
    :QuestDescription => "The local ranger is tired of Rafael's gym puzzle. Find the digit slips and return them to him.",
  }

  QUEST_POKEMON_MASTER = {
    :ID => "9",
    :Name => "Breaking Spirits",
    :QuestGiver => "Mother",
    :Stage1 => "Perfect the fight with the kid.",
    :Stage2 => "Return to the mother.",
    :Location1 => "Grouz, Mine Head's House",
    :Location2 => "Grouz, Mine Head's House",
    :QuestDescription => "A mother is concerned with her kid's career choices. Utterly destroy him.",
  }

  QUEST_SUS_PACKAGE = {
    :ID => "10",
    :Name => "Don't Open It",
    :QuestGiver => "Alolan",
    :Stage1 => "Find their package.",
    :Stage2 => "Return the package.",
    :Location1 => "Prizca West Travel Agency",
    :QuestDescription => "These people report they lost a package to a Gyarados attack, and want you to get it. Must be important, for their job...?",
    :RewardString => "Alolan Wreath"
  }

  QUEST_MEMORY_LANE = {
    :ID => "11",
    :Name => "Down Memory Lane",
    :QuestGiver => "Berry Farmer",
    :Stage1 => "Bring the Pokemon to them.",
    :Location1 => "County Park, Berry Farmer's House",
    :QuestDescription => "This former Team Chasm member has been feeling nostalgic. Bring them a Bergmite, a Klink, a Dreepy, a Makyan Tangela, and an Elekid.",
    :RewardString => "Catching Charm"
  }

  QUEST_AGRAVELER = {
    :ID => "12",
    :Name => "Geodude Frenzy!",
    :QuestGiver => "Scientist",
    :Stage1 => "Defeat the avatar.",
    :Location1 => "Novo Town, Scientist's House",
    :QuestDescription => "The Alolan Geodudes have gone on a frenzy! This Avatar would wreak havoc unchecked.",
  }

  QUEST_ABSOLUS = {
    :ID => "13",
    :Name => "Foreboding",
    :QuestGiver => "Worker",
    :Stage1 => "Defeat the Avatar.",
    :Location1 => "Novo Apartments, Attic",
    :QuestDescription => "An Avatar has invaded Novo Apartments. Assist the Absol it's staring down!",
  }

  QUEST_AEGIS_FRAUD = {
    :ID => "14",
    :Name => "Aegis Insurance Fraud",
    :QuestGiver => "Jogger?",
    :Stage1 => "Find the ID Card.",
    :Stage2 => "Infiltrate the building.",
    :Stage3 => "Return to the Ranger.",
    :Location1 => "Prizca West",
    :Location2 => "Aegis Insurance",
    :Location3 => "Prizca West",
    :QuestDescription => "An undercover Makyan Ranger is investigating Aegis Insurance. Help her infiltrate the building to discover the truth.",
  }

  QUEST_MALASADAS = {
    :ID => "15",
    :Name => "Sewer Dining",
    :QuestGiver => "Dragon Tamer",
    :Stage1 => "Give them 10 Big Malasadas.",
    :Location1 => "Luxtech Sewers",
    :QuestDescription => "[Placeholder].",
  }

end
