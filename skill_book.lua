local function book_on_use(itemstack, user)
  -- local player = minetest.get_player_by_name("Yves")
  -- player:set_attribute("crafting:unlocked", "{}")

  local name = user:get_player_name()
  local unlocked = crafting.get_unlocked(name)
  local book = itemstack:get_definition()

  if(unlocked[book.recipe_name]) then
    -- crafting.lock(name, book.recipe_name)
    return itemstack
  end
  crafting.unlock(name, book.recipe_name)
  sfinv.set_player_inventory_formspec(user)
  itemstack:take_item(1)
  return itemstack

end

local function register_skill_book(recipe_name)
  local description = ItemStack(recipe_name):get_definition().description
  minetest.register_craftitem("crafting:skill_book_"..recipe_name:gsub(":", "_"), {
  	description = "Crafting recipe: "..description,
  	inventory_image = "default_book_written.png",
  	groups = {book = 1},
  	stack_max = 1,
  	on_use = book_on_use,
    recipe_name = recipe_name
  })
end

register_skill_book("default:shovel_wood")
register_skill_book("default:pick_wood")
