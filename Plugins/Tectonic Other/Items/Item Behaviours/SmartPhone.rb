ItemHandlers::UseFromBag.add(:SMARTPHONE,proc { |item|
	takeSelfie
	next 1
})

ItemHandlers::ConfirmUseInField.add(:SMARTPHONE,proc { |item|
  next true
})

ItemHandlers::UseInField.add(:SMARTPHONE,proc { |item|
	next takeSelfie
})