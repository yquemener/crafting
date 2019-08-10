local num_books=1
local function book_on_use(itemstack, user)
  -- local player = minetest.get_player_by_name("Yves")
  -- player:set_attribute("crafting:unlocked", "{}")

  local name = user:get_player_name()
  local unlocked = crafting.get_unlocked(name)
  local book = itemstack:get_definition()

--[[
  if(unlocked[book.recipe_name]) then
    -- crafting.lock(name, book.recipe_name)
    return itemstack
  end ]]--
  crafting.unlock(name, book.recipe_name)
  sfinv.set_player_inventory_formspec(user)
  itemstack:take_item(1)
  return itemstack

end

minetest.register_chatcommand("resetskills", {
	description = "Resets the unlocked recipes of a player",
	params = "<player>",
	privs = {},
	func = function(name, param)
    local unlocked = crafting.get_unlocked(name)
    print("Thats why: "..dump(unlocked))
    for key, value in pairs(unlocked) do
      print(key)
      print(value)
      print(name)
      crafting.lock(name, key)
    end
  end })
print("done?")

local function register_skill_book(recipe_name, description)
  description = description or ItemStack(recipe_name):get_definition().description
  minetest.register_craftitem("crafting:skill_book_"..num_books, { --..recipe_name:gsub(":", "_"), {
  	description = "Crafting recipe: "..description,
  	inventory_image = "default_book_written.png",
  	groups = {book = 1},
  	stack_max = 1,
  	on_use = book_on_use,
    recipe_name = recipe_name
  })
  num_books = num_books+1
end

register_skill_book({"doors:door_wood", "stairs:stair_wood 8","default:ladder_wood 5"}, "Woodworking")
register_skill_book({"doors:door_wood", "stairs:stair_cobble 8","stairs:slab_stone 6"}, "Stoneworking")
register_skill_book({"default:axe_stone", "default:pick_stone", "default:shovel_stone", "default:torch 4"}, "Stone Tools")
