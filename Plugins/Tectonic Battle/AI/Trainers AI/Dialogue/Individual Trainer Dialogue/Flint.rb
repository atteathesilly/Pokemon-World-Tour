PokeBattle_AI::TrainerSendsOutPokemonDialogue.add(:FLINT,
  proc { |_policy, battler, trainer_speaking, dialogue_array|
      if battler.battle.pbAbleCount(battler.index) == battler.battle.sideSizes[1] &&
          !trainer_speaking.policyStates[:CommentedOnLastPokemonYet]
          dialogue_array.push(_INTL("This situation is heating up! I'm blazing now!"))
          trainer_speaking.policyStates[:CommentedOnLastPokemonYet] = true
      end
      next dialogue_array
  }
)

