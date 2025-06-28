def takeSelfie
    blackFadeOutIn {
      # move follower mon
      $PokemonTemp.dependentEvents.refresh_sprite(true)
      followerEvent = pbGetFollowerDependentEvent
      followerEvent.moveto($game_player.x - 1,$game_player.y)

      get_player.turn_down
      followerEvent.turn_down
    }
    pbWait(20)
    timeLabel = Time.now.strftime("[%Y-%m-%d] %H_%M_%S.%L")
    pbScreenCapture(_INTL("Selfie_{1}_{2}",$game_map.name,timeLabel))
    pbWait(20)
end