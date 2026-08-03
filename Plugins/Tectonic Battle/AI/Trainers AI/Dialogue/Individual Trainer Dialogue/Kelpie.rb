PokeBattle_AI::TrainerSendsOutPokemonDialogue.add(:KELPIE,
  proc { |_policy, battler, trainer_speaking, dialogue_array|
      if battler.battle.pbAbleCount(battler.index) == battler.battle.sideSizes[1] &&
          !trainer_speaking.policyStates[:CommentedOnLastPokemonYet]
          dialogue_array.push(_INTL("Well looks like Mel's done with her part, so you're too fucking late!"))
          trainer_speaking.policyStates[:CommentedOnLastPokemonYet] = true
      end
      next dialogue_array
  }
)

