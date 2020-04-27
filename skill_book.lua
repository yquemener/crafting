local S = minetest.get_translator("eduhf")

local num_books=1
local function book_on_use(itemstack, user)
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
    crafting.lock_all(name)
  end })

local function register_skill_book(recipe_name, description)
  description = description or ItemStack(recipe_name):get_definition().description
  minetest.register_craftitem("crafting:skill_book_"..num_books, { --..recipe_name:gsub(":", "_"), {
  	description = S("Crafting recipe: @1", description),
    --description = S("Crafting recipe:")..S(description),
  	inventory_image = "default_book_written.png",
  	groups = {book = 1},
  	stack_max = 1,
  	on_use = book_on_use,
    recipe_name = recipe_name
  })
  num_books = num_books+1
end

register_skill_book({     "doors:door_wood",
                          "stairs:stair_wood 8",
                          "default:ladder_wood 5"},
                          S("Woodworking"))

register_skill_book(    { "stairs:stair_cobble 8",
                          "stairs:slab_cobble 6"},
                      S("Stoneworking"))

register_skill_book(    {"default:axe_stone",
                         "default:pick_stone",
                         "default:shovel_stone",
                         "default:torch 4"},
                      S("Stone Tools"))

register_skill_book(    {"mesecons:wire_00000000_off 4",
                         "mesecons_lightstone:lightstone_yellow_off 1",
                         "mesecons_pressureplates:pressure_plate_wood_off 1",
                         "mesecons_walllever:wall_lever_off 1",
                         "mesecons_torch:mesecon_torch_on 1",
                         "mesecons_gates:not_off 1",
                         "mesecons_gates:and_off 1",
                         "mesecons_pistons:piston_sticky_off 1"
                       },
                      S("Logic Circuits"))
