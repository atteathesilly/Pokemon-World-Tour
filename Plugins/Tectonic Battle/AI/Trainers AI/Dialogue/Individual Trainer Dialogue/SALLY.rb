PokeBattle_AI::TrainerSendsOutPokemonDialogue.add(:SALLY1,
  proc { |_policy, battler, trainer_speaking, dialogue_array|
      if battler.battle.pbAbleCount(battler.index) == battler.battle.sideSizes[1] && !trainer_speaking.policyStates[:LastPokemonComment]
          dialogue_array.push(_INTL("Hah! I've come back from worse fights than this!"))
          trainer_speaking.policyStates[:LastPokemonComment] = true
      end
      next dialogue_array
  }
)