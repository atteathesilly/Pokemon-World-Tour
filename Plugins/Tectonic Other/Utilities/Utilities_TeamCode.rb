require 'stringio'

# Bit protocol shift constants
VERSION_MAJOR_SHIFT = 0
VERSION_MINOR_SHIFT = 5
VERSION_PATCH_SHIFT = 10
VERSION_DEV_SHIFT = 15 # End of header, not repeated - u16
POKEMON_SHIFT = 0
ABILITY_SHIFT = 11
MOVE1_SHIFT = 12
MOVE2_SHIFT = 22 # End of first u32
STYLE_HP_SHIFT = 0
STYLE_ATK_SHIFT = 5
STYLE_DEF_SHIFT = 10
STYLE_SDEF_SHIFT = 15
STYLE_SPEED_SHIFT = 20
LEVEL_SHIFT = 25 # End of second u32
MOVE3_SHIFT = 0
MOVE4_SHIFT = 10
ITEM1_SHIFT = 20
FLAG_HAS_2_ITEM_SHIFT = 28
FLAG_HAS_ITEM1_TYPE_SHIFT = 29
FLAG_HAS_FORM_SHIFT = 30 # End of third u32

# Byte protocol masks
VERSION_MAJOR_MASK = 0b11111 << VERSION_MAJOR_SHIFT
VERSION_MINOR_MASK = 0b11111 << VERSION_MINOR_SHIFT
VERSION_PATCH_MASK = 0b11111 << VERSION_PATCH_SHIFT
VERSION_DEV_MASK = 0b1 << VERSION_DEV_SHIFT
POKEMON_MASK = 0b111_1111_1111 << POKEMON_SHIFT
ABILITY_MASK = 0b1 << ABILITY_SHIFT
MOVE1_MASK = 0b11_1111_1111 << MOVE1_SHIFT
MOVE2_MASK = 0b11_1111_1111 << MOVE2_SHIFT
STYLE_HP_MASK = 0b11111 << STYLE_HP_SHIFT
STYLE_ATK_MASK = 0b11111 << STYLE_ATK_SHIFT
STYLE_DEF_MASK = 0b11111 << STYLE_DEF_SHIFT
STYLE_SDEF_MASK = 0b11111 << STYLE_SDEF_SHIFT
STYLE_SPEED_MASK = 0b11111 << STYLE_SPEED_SHIFT
LEVEL_MASK = 0b1111111 << LEVEL_SHIFT
MOVE3_MASK = 0b11_1111_1111 << MOVE3_SHIFT
MOVE4_MASK = 0b11_1111_1111 << MOVE4_SHIFT
ITEM1_MASK = 0b1111_1111 << ITEM1_SHIFT
FLAG_HAS_2_ITEM_MASK = 0b1 << FLAG_HAS_2_ITEM_SHIFT
FLAG_HAS_ITEM1_TYPE_MASK = 0b1 << FLAG_HAS_ITEM1_TYPE_SHIFT
FLAG_HAS_FORM_MASK = 0b1 << FLAG_HAS_FORM_SHIFT

MIN_BYTES_PER_POKEMON = 12
MAX_BYTES_PER_POKEMON = 16

def get_held_item_index(symbol)
  symbols = GameData::Item.keys.filter{ |key| !key.is_a?(Numeric) && key.is_a?(Symbol) && GameData::Item.get(key).pocket == 5 }
  index = symbols.find_index(symbol)
  if index.nil? 
    return -1 
  end
  return index
end

def pokemon_to_indices(mon)
  species_data = GameData::Species.get(mon.species)
  species = species_data.id_number - 1 # Pokedex order corresponds to index order
  ability = mon.ability_index
  moves = mon.moves.map { |move| species_data.learnable_moves.find_index(move.id) }
  moves.fill(-1, moves.length..3)
  sp = mon.ev
  level = mon.level
  items = mon.items.map { |item| get_held_item_index(item.id) }
  items.fill(-1, items.length..1)

  indices = []

  # First u32: Pokemon, ability, move1, move2
  indices.push(species)
  indices.push(ability)
  indices.push(moves[0])
  indices.push(moves[1])

  # Second u32: Style points and level
  indices.push(sp[:HP])
  indices.push(sp[:ATTACK]) # same as spatk
  indices.push(sp[:DEFENSE])
  indices.push(sp[:SPECIAL_DEFENSE])
  indices.push(sp[:SPEED])
  indices.push(level)

  # Third u32: Move3, move4, item1, and flags
  indices.push(moves[2])
  indices.push(moves[3])
  indices.push(items[0])
  return indices
end

def encode_chunk(buffer, byte_offset, indices)
  first_u32 = 0
  second_u32 = 0
  third_u32 = 0

  # First u32: Pokemon, ability, move1, move2
  first_u32 |= (indices[0] << POKEMON_SHIFT) & POKEMON_MASK
  first_u32 |= (indices[1] { |x| x.id == data.ability.id } << ABILITY_SHIFT) & ABILITY_MASK
  first_u32 |= (indices[2] << MOVE1_SHIFT) & MOVE1_MASK
  first_u32 |= (indices[3] << MOVE2_SHIFT) & MOVE2_MASK

  buffer.write([first_u32].pack('N'), byte_offset)
  byte_offset += 4

  # Second u32: Style points and level
  second_u32 |= (indices[4] << STYLE_HP_SHIFT) & STYLE_HP_MASK
  second_u32 |= (indices[5] << STYLE_ATK_SHIFT) & STYLE_ATK_MASK
  second_u32 |= (indices[6] << STYLE_DEF_SHIFT) & STYLE_DEF_MASK
  second_u32 |= (indices[7] << STYLE_SDEF_SHIFT) & STYLE_SDEF_MASK
  second_u32 |= (indices[8] << STYLE_SPEED_SHIFT) & STYLE_SPEED_MASK
  second_u32 |= (indices[9] << LEVEL_SHIFT) & LEVEL_MASK
  
  buffer.write([second_u32].pack('N'), byte_offset)
  byte_offset += 4

  # TODO: Include optional data
  # Check for optional data
  # has_second_item = data.items.size > 1 && data.items[1].id != :NULL_ITEM
  # has_item_type = data.item_types.size > 0 && data.item_types[0].id != :NULL_TYPE
  # has_form = data.form != 0  # Assuming nullForm.formId is 0

  # Third u32: Move3, move4, item1, and flags
  third_u32 |= (indices[10] << MOVE3_SHIFT) & MOVE3_MASK
  third_u32 |= (indices[11] << MOVE4_SHIFT) & MOVE4_MASK
  third_u32 |= (indices[12] << ITEM1_SHIFT) & ITEM1_MASK
  # TODO: Include optional data
  third_u32 |= (false ? 1 : 0) << FLAG_HAS_2_ITEM_SHIFT
  third_u32 |= (false ? 1 : 0) << FLAG_HAS_ITEM1_TYPE_SHIFT
  third_u32 |= (false ? 1 : 0) << FLAG_HAS_FORM_SHIFT
  
  buffer.write([third_u32].pack('N'), byte_offset)
  byte_offset += 4

  # TODO: Write optional data
  # if has_second_item
  #   buffer.write([held_items.find_index { |x| x.id == data.items[1].id }].pack('C'), byte_offset)
  #   byte_offset += 1
  # end

  # if has_item_type
  #   buffer.write([version_map[:indices][:types][data.item_type.id]].pack('C'), byte_offset)
  #   byte_offset += 1
  # end

  # if has_form
  #   buffer.write([data.form].pack('C'), byte_offset)
  #   byte_offset += 1
  # end

  byte_offset
end

def encode_team(party)
  # Create a string buffer to write binary data
  buffer = StringIO.new
  
  # Process version information
  version_split = Settings::GAME_VERSION.split(".")
  version_u16 = Settings::DEV_VERSION ? VERSION_DEV_MASK : 0
  version_u16 |= (version_split[0].to_i & 0x1f) << VERSION_MAJOR_SHIFT
  version_u16 |= (version_split[1].to_i & 0x1f) << VERSION_MINOR_SHIFT
  version_u16 |= (version_split[2].to_i & 0x1f) << VERSION_PATCH_SHIFT
  
  # Write version to buffer
  buffer.write([version_u16].pack('n'))
  
  # Encode each Pokémon in the party
  byte_offset = 2
  party.each do |indices|
    byte_offset = encode_chunk(buffer, byte_offset, indices)
  end

  # Truncate buffer to actual data size
  buffer.truncate(byte_offset)
  
  # Convert to base64
  [buffer.string].pack('m0')
end