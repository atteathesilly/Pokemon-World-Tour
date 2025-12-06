PokeBattle_AI::TrainerSendsOutPokemonDialogue.add(:CHUCK,
  proc { |_policy, battler, trainer_speaking, dialogue_array|
      if battler.battle.pbAbleCount(battler.index) == battler.battle.sideSizes[1] &&
          !trainer_speaking.policyStates[:CommentedOnLastPokemonYet]
          dialogue_array.push(_INTL("WAHAHA! I haven't had a fight this good in ages!"))
          trainer_speaking.policyStates[:CommentedOnLastPokemonYet] = true
      end
      next dialogue_array
  }
)

