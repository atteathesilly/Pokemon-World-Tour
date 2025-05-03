def unownStatThing(level)
  statBonus = 0

  if level <= 30
    statBonus = 0.05
  elsif level <= 50
    statBonus = 0.15
  else
    statBonus = 0.30
  end

  return statBonus

end