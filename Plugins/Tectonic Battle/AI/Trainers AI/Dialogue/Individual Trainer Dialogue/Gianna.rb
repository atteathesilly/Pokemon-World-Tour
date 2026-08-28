PokeBattle_AI::TrainerSendsOutPokemonDialogue.add(:GIANNA,
  proc { |_policy, battler, trainer_speaking, dialogue_array|
      if battler.battle.pbAbleCount(battler.index) == battler.battle.sideSizes[1] &&
          !trainer_speaking.policyStates[:CommentedOnLastPokemonYet]
          dialogue_array.push(_INTL("This may be my last 'mon, but I still have Pika Power to spare!"))
          trainer_speaking.policyStates[:CommentedOnLastPokemonYet] = true
      end
      next dialogue_array
  }
)

