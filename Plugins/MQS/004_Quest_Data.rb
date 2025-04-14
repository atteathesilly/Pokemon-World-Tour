module QuestModule
  
  # Major NPC Side Quests
  
  QUEST_IMOGENE = {
    :ID => "0",
    :Name => _INTL("WIP: The Duplicate Sage"),
    :Stage1 => _INTL("Find them north of Svait."),
    :Stage2 => _INTL("Find them post surf."),
    :Stage3 => _INTL("Find them back south."),
    :Stage4 => _INTL("Find them near the Lingering Delta."),
    :Location1 => _INTL("Ice Cave"),
    :Location2 => _INTL("Prizca West"),
    :Location3 => _INTL("Grouz"),
    :Location4 => _INTL("Carnation Graves"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }
  
  QUEST_ALESSA = {
    :ID => "1",
    :Name => _INTL("WIP: Alessa Quest"),
    :Stage1 => _INTL("Find them in the sewers."),
    :Stage2 => _INTL("Find them post surf."),
    :Stage3 => _INTL("Find them back south."),
    :Stage4 => _INTL("Find them near Team Chasm HQ."),
    :Location1 => _INTL("Luxtech Sewers"),
    :Location2 => _INTL("Prizca East"),
    :Location3 => _INTL("Volcanic Shore"),
    :Location4 => _INTL("Hollowed Layer"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }
  
  QUEST_SKYLER = {
    :ID => "2",
    :Name => _INTL("WIP: Skyler Quest"),
    :Stage1 => _INTL("Find them in Velenz."),
    :Stage2 => _INTL("Find them north east."),
    :Stage3 => _INTL("Find them back south."),
    :Stage4 => _INTL("Find them on the southern mountain."),
    :Location1 => _INTL("Velenz"),
    :Location2 => _INTL("Prizca East"),
    :Location3 => _INTL("Team Chasm HQ"),
    :Location4 => _INTL("Kilna Ascent"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }
  
  QUEST_KEONI = {
    :ID => "3",
    :Name => _INTL("WIP: Keoni Quest"),
    :Stage1 => _INTL("Find them post surf."),
    :Stage2 => _INTL("Find them in the sewers."),
    :Stage3 => _INTL("Find them back south."),
    :Stage4 => _INTL("Find them near Velenz."),
    :Location1 => _INTL("Eleig Stretch"),
    :Location2 => _INTL("Sewer Junction"),
    :Location3 => _INTL("Novo College"),
    :Location4 => _INTL("Velenz Menagerie"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }
  
  QUEST_EIFION = {
    :ID => "4",
    :Name => _INTL("WIP: Eifion Quest"),
    :Stage1 => _INTL("Find them near the river."),
    :Stage2 => _INTL("Find them up river."),
    :Stage3 => _INTL("Find them in the shack."),
    :Stage4 => _INTL("Find them near the lake."),
    :Location1 => _INTL("Eleig River Crossing"),
    :Location2 => _INTL("Highland Lake"),
    :Location3 => _INTL("Tournament Grounds"),
    :Location4 => _INTL("Abyssal Cavern"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }
  
  QUEST_CANDY = {
    :ID => "5",
    :Name => _INTL("WIP: Candy Quest"),
    :Stage1 => _INTL("Enter the man's house."),
    :Stage2 => _INTL("Find them at the college."),
    :Stage3 => _INTL("Find them post surf."),
    :Stage4 => _INTL("Find them in a cave."),
    :Stage5 => _INTL("Find them at the river."),
    :Location1 => _INTL("Barren Crater"),
    :Location2 => _INTL("Novo College"),
    :Location3 => _INTL("Prizca West"),
    :Location4 => _INTL("Cave of Hatching"),
    :Location5 => _INTL("Eleig Stretch"),
    :QuestDescription => _INTL("[Ask Writer for Desc]."),
  }

  # Fetch/Misc Quests

  QUEST_LOST_GROWLITHE = {
    :ID => "6",
    :Name => _INTL("Lost Puppy"),
    :QuestGiver => _INTL("School Kid"),
    :Stage1 => _INTL("Find the Growlithe."),
    :Stage2 => _INTL("Return to the kid."),
    :Location1 => _INTL("Repora Forest"),
    :Location2 => _INTL("Novo Apartments"),
    :QuestDescription => _INTL("The kid in Novo Apartments is asking you to find his Growlithe, which is lost in Repora Forest."),
  }

  QUEST_HIDE_AND_SEEK = {
    :ID => "7",
    :Name => _INTL("Hide and Seek"),
    :QuestGiver => _INTL("TM Kid"),
    :Stage1 => _INTL("Find him."),
    :Stage2 => _INTL("Find him again."),
    :Location1 => _INTL("Casaba Island"),
    :Location2 => _INTL("Casaba Island"),
    :QuestDescription => _INTL("Play hide and seek with the kid who said they'd give you TMs."),
    :RewardString => _INTL("TMs!")
  }

  QUEST_DIGIT_SLIPS = {
    :ID => "8",
    :Name => _INTL("An Inconvenienced Ranger"),
    :QuestGiver => _INTL("Ranger"),
    :Stage1 => _INTL("Find all the digit slips."),
    :Location1 => _INTL("Menagerie-Velenz Gatehouse"),
    :QuestDescription => _INTL("The local ranger is tired of Rafael's gym puzzle. Find the digit slips and return them to him."),
  }

  QUEST_POKEMON_MASTER = {
    :ID => "9",
    :Name => _INTL("Breaking Spirits"),
    :QuestGiver => _INTL("Mother"),
    :Stage1 => _INTL("Perfect the fight with the kid."),
    :Stage2 => _INTL("Return to the mother."),
    :Location1 => _INTL("Grouz, Mine Head's House"),
    :Location2 => _INTL("Grouz, Mine Head's House"),
    :QuestDescription => _INTL("A mother is concerned with her kid's career choices. Utterly destroy him."),
  }

  QUEST_SUS_PACKAGE = {
    :ID => "10",
    :Name => _INTL("Don't Open It"),
    :QuestGiver => _INTL("Alolan"),
    :Stage1 => _INTL("Find their package."),
    :Stage2 => _INTL("Return the package."),
    :Location1 => _INTL("Prizca West Travel Agency"),
    :Location1 => _INTL("Prizca West Travel Agency"),
    :QuestDescription => _INTL("These people report they lost a package to a Gyarados attack, and want you to get it. Must be important, for their job...?"),
    :RewardString => _INTL("Alolan Wreath")
  }

  QUEST_MEMORY_LANE = {
    :ID => "11",
    :Name => _INTL("Down Memory Lane"),
    :QuestGiver => _INTL("Berry Farmer"),
    :Stage1 => _INTL("Bring the Pokemon to them."),
    :Location1 => _INTL("County Park, Berry Farmer's House"),
    :QuestDescription => _INTL("This former Team Chasm member has been feeling nostalgic. Bring them a Bergmite, a Klink, a Dreepy, a Makyan Tangela, and an Elekid."),
    :RewardString => _INTL("Catching Charm")
  }

  QUEST_AGRAVELER = {
    :ID => "12",
    :Name => _INTL("Geodude Frenzy!"),
    :QuestGiver => _INTL("Scientist"),
    :Stage1 => _INTL("Defeat the avatar."),
    :Location1 => _INTL("Novo Town, Scientist's House"),
    :QuestDescription => _INTL("The Alolan Geodudes have gone on a frenzy! This Avatar would wreak havoc unchecked."),
  }

  QUEST_ABSOLUS = {
    :ID => "13",
    :Name => _INTL("Foreboding"),
    :QuestGiver => _INTL("Worker"),
    :Stage1 => _INTL("Defeat the Avatar."),
    :Location1 => _INTL("Novo Apartments, Attic"),
    :QuestDescription => _INTL("An Avatar has invaded Novo Apartments. Assist the Absol it's staring down!"),
  }

  QUEST_AEGIS_FRAUD = {
    :ID => "14",
    :Name => _INTL("Aegis Insurance Fraud"),
    :QuestGiver => _INTL("Jogger?"),
    :Stage1 => _INTL("Find the ID Card."),
    :Stage2 => _INTL("Infiltrate the building."),
    :Stage3 => _INTL("Return to the Ranger."),
    :Location1 => _INTL("Prizca West"),
    :Location2 => _INTL("Aegis Insurance"),
    :Location3 => _INTL("Prizca West"),
    :QuestDescription => _INTL("An undercover Makyan Ranger is investigating Aegis Insurance. Help her infiltrate the building to discover the truth."),
  }

  QUEST_MALASADAS = {
    :ID => "15",
    :Name => _INTL("Sewer Dining"),
    :QuestGiver => _INTL("Dragon Tamer"),
    :Stage1 => _INTL("Give them 10 Big Malasadas."),
    :Location1 => _INTL("Luxtech Sewers"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  # Gym Leader Avatars

  QUEST_GYM_AVATARS_1 = {
    :ID => "16",
    :Name => _INTL("The Lightning God"),
    :QuestGiver => _INTL("Lambert"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Casaba Villa, Lambert's House"),
    :Location2 => _INTL("Casaba Villa, Lambert's House"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_2 = {
    :ID => "17",
    :Name => _INTL("A Song and a Dance"),
    :QuestGiver => _INTL("Eko"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Shipping Lane"),
    :Location2 => _INTL("Novo Gym"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_3 = {
    :ID => "18",
    :Name => _INTL("A Nature's Reprieve"),
    :QuestGiver => _INTL("Helena"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Team Chasm HQ"),
    :Location2 => _INTL("Luxtech Gym"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_4 = {
    :ID => "19",
    :Name => _INTL("The World's Rebirth"),
    :QuestGiver => _INTL("Rafael"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Velenz, Rafael's House"),
    :Location2 => _INTL("Velenz, Rafael's House"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_5 = {
    :ID => "19",
    :Name => _INTL("The Knight's Weapons"),
    :QuestGiver => _INTL("Zoe"),
    :Stage2 => _INTL("Defeat what lurks behind the door."),
    :Stage3 => _INTL("Report back about your success."),
    :Location1 => _INTL("Eleig River Crossing, Worn Shed"),
    :Location2 => _INTL("Eleig River Crossing, Worn Shed"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_6 = {
    :ID => "20",
    :Name => _INTL("The Multicolored Stag"),
    :QuestGiver => _INTL("Noel"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Ancient Sewers"),
    :Location2 => _INTL("Prizca East Gym"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_7 = {
    :ID => "21",
    :Name => _INTL("A Meteoric Being"),
    :QuestGiver => _INTL("Victoire"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Sweetrock Harbor"),
    :Location2 => _INTL("Sweetrock Harbor Gym"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  QUEST_GYM_AVATARS_8 = {
    :ID => "22",
    :Name => _INTL("The Mythical Serpent"),
    :QuestGiver => _INTL("Samorn"),
    :Stage1 => _INTL("Defeat what lurks behind the door."),
    :Stage2 => _INTL("Report back about your success."),
    :Location1 => _INTL("Kilna Ascent"),
    :Location2 => _INTL("Team Chasm HQ Gym"),
    :QuestDescription => _INTL("[Placeholder]."),
  }

  # Avatar Bounties
  
  QUEST_CROBAT = {
    :ID => "23",
    :Name => _INTL("Bounty: Crobat Avatar"),
    :QuestGiver => _INTL("Ranger"),
    :Stage1 => _INTL("Defeat the Crobat Avatar."),
    :Stage2 => _INTL("Report back to the Ranger."),
    :Location1 => _INTL("Underpeak Tunnels"),
    :Location2 => _INTL("Peaks-Harbor Gatehouse"),
    :QuestDescription => _INTL("A ranger is asking you to deal with a Crobat Avatar lying in the tunnels under Split Peaks. Says he'll make it worth your while."),
  }

  QUEST_BEARTIC = {
    :ID => "24",
    :Name => _INTL("Bounty: Beartic Avatar"),
    :QuestGiver => _INTL("Ranger"),
    :Stage1 => _INTL("Defeat the Beartic Avatar."),
    :Stage2 => _INTL("Report back to the Ranger."),
    :Location1 => _INTL("Gigalith's Guts"),
    :Location2 => _INTL("Svait-Park Gatehouse"),
    :QuestDescription => _INTL("A ranger is asking you to deal with a Beartic Avatar lying in the Gigalith's Guts. Says he'll make it worth your while."),
  }

  QUEST_MAROMATISSE = {
    :ID => "25",
    :Name => _INTL("Bounty: M. Aromatisse Avatar"),
    :QuestGiver => _INTL("Ranger"),
    :Stage1 => _INTL("Defeat the M. Aromatisse Avatar."),
    :Stage2 => _INTL("Report back to the Ranger."),
    :Location1 => _INTL("Highland Lake"),
    :Location2 => _INTL("West-Plaza Gatehouse"),
    :QuestDescription => _INTL("A ranger is asking you to deal with a Makyan Aromatisse Avatar lying in the Highland Lake... apparently. Says he'll make it worth your while."),
  }

  QUEST_MONKES = {
    :ID => "26",
    :Name => _INTL("Bounty: Monkey Trio Avatars"),
    :QuestGiver => _INTL("Ranger"),
    :Stage1 => _INTL("Defeat the trio of Monkey Avatars."),
    :Stage2 => _INTL("Report back to the Ranger."),
    :Location1 => _INTL("The Shelf"),
    :Location2 => _INTL("Shelf-Novo Gatehouse"),
    :QuestDescription => _INTL("A ranger is asking you to deal with a trio of Avatars, a Pansage, Pansear, and Panpour, lying in The Shelf. Says she'll make it worth your while."),
  }

  # Legendary Quests

  QUEST_LEGEND_CLONE = {
    :ID => "27",
    :Name => _INTL("A Primordial Material"),
    :QuestGiver => _INTL("Dr. Hekata"),
    :Stage1 => _INTL("Talk to Dr. Hekata."),
    :Stage2 => _INTL("Return to the Path of Paradise."),
    :Stage3 => _INTL("Report back to Dr. Hekata."),
    :Location1 => _INTL("Grouz"),
    :Location2 => _INTL("Hollowed Layer"),
    :Location3 => _INTL("Grouz"),
    :QuestDescription => _INTL("Dr. Hekata gave you a call mysteriously, asking to meet her in her home of Grouz. What could she want of you?"),
  }

  QUEST_LEGEND_CELEBI = {
    :ID => "28",
    :Name => _INTL("Turn Back the Clock"),
    :QuestGiver => _INTL("Celebi"),
    :Stage1 => _INTL("Plant the seeds."),
    :Location1 => _INTL("Crumbling Canyon"),
    :QuestDescription => _INTL("The mythical being named Celebi handed you four latent seeds. Perhaps you need to plant these somewhere? Afterwards, seek out Celebi."),
  }

  QUEST_LEGEND_REGIROCK = {
    :ID => "29",
    :Name => _INTL("The Age of Stone"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Make your way through the dungeon."),
    :Location1 => _INTL("Crumbling Canyon"),
    :QuestDescription => _INTL("A strange dungeon lies before you. A crumbling canyon, carved out and inhabitated in an ancient time. That ancient time may not be as far away as it seems, however..."),
  }

  QUEST_LEGEND_REGICE = {
    :ID => "30",
    :Name => _INTL("The Age of Ice"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Make your way through the dungeon."),
    :Location1 => _INTL("Mirror Tundra"),
    :QuestDescription => _INTL("A strange dungeon lies before you. A frozen wasteland, locked in time and place, rigid and reflective obstacles blocking your way. Perhaps a reflection of times long past."),
  }

  QUEST_LEGEND_HOOPA = {
    :ID => "31",
    :Name => _INTL("Spacial Split"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Find all the lost rangers."),
    :Location1 => _INTL("Mirror Tundra"),
    :QuestDescription => _INTL("You found a strange set of... spectres? Spirits? Whatever they could be, defeating them in a battle appears to give some resolution to this situation... What could've caused this?"),
  }

  QUEST_LEGEND_REGISTEEL = {
    :ID => "32",
    :Name => _INTL("The Age of Steel"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Make your way through the dungeon."),
    :Location1 => _INTL("Alloyed Thicket"),
    :QuestDescription => _INTL("A strange dungeon lies before you. A forest made of metals and alloys. Always malleable, always changing, the line between natural and man-made thin..."),
  }

  QUEST_LEGEND_MELTAN = {
    :ID => "33",
    :Name => _INTL("A Collapsed Metal"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Find the Meltan scattered about."),
    :Location1 => _INTL("Alloyed Thicket"),
    :QuestDescription => _INTL("A strange metallic creature fell apart into multiple smaller creatures, and scattered about the Alloyed Thicket. What might happen if you reunite them together?"),
  }

  QUEST_LEGEND_REGIDRAGO = {
    :ID => "34",
    :Name => _INTL("The Age of Myths"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Make your way through the dungeon."),
    :Location1 => _INTL("The Catacombs"),
    :QuestDescription => _INTL("A strange dungeon lies before you. Winding age-old catacombs, full of myths and legends. Stories will be the basis of humanity for as long as it will exist."),
  }

  QUEST_LEGEND_MARSHADOW = {
    :ID => "35",
    :Name => _INTL("Always In Character"),
    :QuestGiver => _INTL("The LARPers"),
    :Stage1 => _INTL("See if you can find them again."),
    :Location1 => _INTL("???"),
    :QuestDescription => _INTL("Quite an eclectic group you've found. You've claimed their hoard, but this surely isn't the last time you'll find yourself encountering them."),
  }

  QUEST_LEGEND_REGIELEKI = {
    :ID => "35",
    :Name => _INTL("Age of Electricity"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Make your way through the dungeon."),
    :Location1 => _INTL("Oasis System"),
    :QuestDescription => _INTL("A strange dungeon lies before you. Circuits run throughout the entire cave, in a similar way to the small streams of water. Electrical currents flow like water, opening the way forward to your goal."),
  }

  QUEST_LEGEND_NULL = {
    :ID => "36",
    :Name => _INTL("The Most Dangerous Experiment"),
    :QuestGiver => _INTL("???"),
    :Stage1 => _INTL("Fight through the scientists."),
    :Location1 => _INTL("Battle Plaza Underground"),
    :QuestDescription => _INTL("A group of scientists appear to be guarding something important. You never were one for not sticking your nose in everything, what would a bunch of nerds hold up against you?"),
  }

  QUEST_LEGEND_VICTINI = {
    :ID => "37",
    :Name => _INTL("The Novo Battle Club"),
    :QuestGiver => _INTL("Fight Club Louis"),
    :Stage1 => _INTL("Fight your way up through the ranks."),
    :Location1 => _INTL("Novo Town"),
    :QuestDescription => _INTL("Louis is holding a Battle Club in Novo town. Simply a way to entertain yourselves and your Pokemon."),
  }

end
