def jovanFliesAway
  Pokemon.play_cry(:TROPIUS)
  pbWait(40)
  blackFadeOutIn(20) {
    pbSEPlay("Fly")
    incrementGlobalVar(44)
  }
end