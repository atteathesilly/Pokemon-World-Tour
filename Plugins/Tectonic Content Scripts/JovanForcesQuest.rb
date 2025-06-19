def jovanFliesAway
  Pokemon.play_cry(:TROPIUS)
  pbWait(40)
  blackFadeOutIn(20) {
    pbSEPlay("Fly")
    incrementGlobalVar(44)
  }
end

def forceFliesAway(eventID,species,globalSwitchID)
  showExclamation(eventID)
  pbWait(30)
  blackFadeOutIn {
    Pokemon.play_cry(species)
    pbWait(40)
    pbSEPlay("Fly")
    setGlobalSwitch(globalSwitchID)
  }
end