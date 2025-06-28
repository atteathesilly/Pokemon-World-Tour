def takeSelfie
    caption = ""
    blackFadeOutIn {
      # move follower mon
      $PokemonTemp.dependentEvents.refresh_sprite(true)
      followerEvent = pbGetFollowerDependentEvent
      followerEvent.moveto($game_player.x - 1,$game_player.y)

      get_player.turn_down
      followerEvent.turn_down

      # Set the text
      caption = pbEnterText(_INTL("Enter caption."),0,50,"",0,nil,true)
    }
    pbWait(10)

    # Set up text graphics elements
    base   = MessageConfig.pbDefaultTextMainColor
    shadow = MessageConfig.pbDefaultTextShadowColor
    viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    viewport.z = 99999
    overlay = BitmapSprite.new(Graphics.width, Graphics.height, viewport)
    overlay.bitmap.font.size = 32
    
    # Draw the text
    pbDrawTextPositions(overlay.bitmap,[
      [caption,Graphics.width / 2, Graphics.height / 2 + 40, 2, base, shadow, true]
    ])

    pbWait(30)

    # Take the screenshot
    timeLabel = Time.now.strftime("[%Y-%m-%d] %H_%M_%S.%L")
    pbScreenCapture(_INTL("Selfie_{1}_{2}",$game_map.name,timeLabel))

    pbWait(80)

    # Dispose of elements
    overlay.dispose
    viewport.dispose
end