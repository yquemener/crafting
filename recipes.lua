--[[  All the recipes
if minetest.get_modpath("crafting") then
	-- spairs function licensed CC-BY-SA 3.0
	-- https://stackoverflow.com/questions/15706270/sort-a-table-in-lua
	function spairs(t, order)
		-- collect the keys
		local keys = {}
		for k in pairs(t) do keys[#keys+1] = k end

		-- if order function given, sort by it by passing the table and keys a, b,
		-- otherwise just sort the keys
		if order then
			table.sort(keys, function(a,b) return order(t, a, b) end)
		else
			table.sort(keys)
		end

		-- return the iterator function
		local i = 0
		return function()
			i = i + 1
			if keys[i] then
				return keys[i], t[keys[i] ]
			end
		end
	end

	local function combine(recipe)
		local item_counts = {}
		for _, itemstring in pairs(recipe.items) do -- must use pairs here because some slots are nil.
			local stack = ItemStack(itemstring)
			local item_name = stack:get_name()
			item_counts[item_name] = (item_counts[item_name] or 0) + stack:get_count()
		end
		local stacks = {}
		for name, count in pairs(item_counts) do
			table.insert(stacks, name.." "..count)
		end
		return stacks
	end

	minetest.register_on_mods_loaded(function()
		for name in spairs(minetest.registered_items) do
			local recipes = minetest.get_all_craft_recipes(name)
			if recipes then
				for _, recipe in ipairs(recipes) do
					if recipe.method == "normal" or "cooking" then
						local crafting_type = "inv"
						if recipe.method == "cooking" then
							crafting_type = "furnace"
						end
						crafting.register_recipe({
							type = crafting_type,
							output = recipe.output,
							items = combine(recipe),
							always_known = true,
						})
					end
				end
			end
		end
	end)
end --]]

-- All non-furnace recipes
--[[crafting.register_recipe({type = "inv",output = "beds:bed",items = {
	"wool:white 3",
	"group:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "beds:fancy_bed",items = {
	"group:wood 3",
	"wool:white 3",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "binoculars:binoculars",items = {
	"default:bronze_ingot 3",
	"default:obsidian_glass 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "boats:boat",items = {
	"group:wood 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "bucket:bucket_empty 1",items = {
	"default:steel_ingot 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "carts:brakerail 18",items = {
	"default:steel_ingot 6",
	"group:wood 2",
	"default:coal_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "carts:cart",items = {
	"default:steel_ingot 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "carts:powerrail 18",items = {
	"default:steel_ingot 6",
	"group:wood 2",
	"default:mese_crystal 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "carts:rail 18",items = {
	"default:steel_ingot 6",
	"group:wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_tree",items = {
	"stairs:slab_acacia_tree 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_tree 3",items = {
	"stairs:stair_acacia_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_wood",items = {
	"stairs:slab_acacia_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_wood 3",items = {
	"stairs:stair_acacia_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_wood",items = {
	"default:acacia_bush_stem 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:acacia_wood 4",items = {
	"default:acacia_tree 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:aspen_tree",items = {
	"stairs:slab_aspen_tree 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:aspen_tree 3",items = {
	"stairs:stair_aspen_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:aspen_wood",items = {
	"stairs:slab_aspen_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:aspen_wood 3",items = {
	"stairs:stair_aspen_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:aspen_wood 4",items = {
	"default:aspen_tree 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_bronze",items = {
	"group:stick 2",
	"default:bronze_ingot 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_diamond",items = {
	"default:diamond 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_mese",items = {
	"default:mese_crystal 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_steel",items = {
	"default:steel_ingot 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:axe_wood",items = {
	"group:stick 2",
	"group:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:book",items = {
	"default:paper 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bookshelf",items = {
	"default:book 3",
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:book_written",items = {
	"default:book_written 1",
	"default:book 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:brick",items = {
	"stairs:slab_brick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:brick 3",items = {
	"stairs:stair_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:brick",items = {
	"default:clay_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bronzeblock",items = {
	"stairs:slab_bronzeblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bronzeblock 3",items = {
	"stairs:stair_bronzeblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bronzeblock",items = {
	"default:bronze_ingot 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bronze_ingot 9",items = {
	"default:bronzeblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:bronze_ingot 9",items = {
	"default:tin_ingot 1",
	"default:copper_ingot 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:cactus",items = {
	"stairs:slab_cactus 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:cactus 3",items = {
	"stairs:stair_cactus 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:chest",items = {
	"group:wood 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:chest_locked",items = {
	"default:chest 1",
	"default:steel_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:chest_locked",items = {
	"default:steel_ingot 1",
	"group:wood 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:clay",items = {
	"default:clay_lump 4"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:clay_brick",items = {
	"default:clay_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:clay_brick 4",items = {
	"default:brick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:clay_lump 4",items = {
	"default:clay 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coalblock",items = {
	"stairs:slab_coalblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coalblock 3",items = {
	"stairs:stair_coalblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coalblock",items = {
	"default:coal_lump 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coal_lump 9",items = {
	"default:coalblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:cobble",items = {
	"stairs:slab_cobble 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:cobble 3",items = {
	"stairs:stair_cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:copperblock",items = {
	"stairs:slab_copperblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:copperblock 3",items = {
	"stairs:stair_copperblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:copperblock",items = {
	"default:copper_ingot 9"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:copper_ingot",items = {
	"default:copper_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:copper_ingot 9",items = {
	"default:copperblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_brown",items = {
	"stairs:slab_coral_brown 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_brown 3",items = {
	"stairs:stair_coral_brown 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_orange",items = {
	"stairs:slab_coral_orange 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_orange 3",items = {
	"stairs:stair_coral_orange 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_skeleton",items = {
	"stairs:slab_coral_skeleton 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:coral_skeleton 3",items = {
	"stairs:stair_coral_skeleton 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_cobble",items = {
	"stairs:slab_desert_cobble 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_cobble 3",items = {
	"stairs:stair_desert_cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sand 4",items = {
	"default:desert_sandstone 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone",items = {
	"stairs:slab_desert_sandstone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone 3",items = {
	"stairs:stair_desert_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone",items = {
	"default:desert_sand 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_block",items = {
	"stairs:slab_desert_sandstone_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_block 3",items = {
	"stairs:stair_desert_sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_block 9",items = {
	"default:desert_sandstone 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_brick",items = {
	"stairs:slab_desert_sandstone_brick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_brick 3",items = {
	"stairs:stair_desert_sandstone_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_sandstone_brick 4",items = {
	"default:desert_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stone",items = {
	"stairs:slab_desert_stone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stone 3",items = {
	"stairs:stair_desert_stone 4"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:desert_stone",items = {
	"default:desert_cobble 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stone_block",items = {
	"stairs:slab_desert_stone_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stone_block 3",items = {
	"stairs:stair_desert_stone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stone_block 9",items = {
	"default:desert_stone 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stonebrick",items = {
	"stairs:slab_desert_stonebrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stonebrick 3",items = {
	"stairs:stair_desert_stonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:desert_stonebrick 4",items = {
	"default:desert_stone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:diamond 9",items = {
	"default:diamondblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:diamondblock",items = {
	"stairs:slab_diamondblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:diamondblock 3",items = {
	"stairs:stair_diamondblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:diamondblock",items = {
	"default:diamond 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:emergent_jungle_sapling",items = {
	"default:junglesapling 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_acacia_wood 4",items = {
	"group:stick 2",
	"default:acacia_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_aspen_wood 4",items = {
	"group:stick 2",
	"default:aspen_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_junglewood 4",items = {
	"default:junglewood 4",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_pine_wood 4",items = {
	"group:stick 2",
	"default:pine_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_rail_acacia_wood 16",items = {
	"default:acacia_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_rail_aspen_wood 16",items = {
	"default:aspen_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_rail_junglewood 16",items = {
	"default:junglewood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_rail_pine_wood 16",items = {
	"default:pine_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_rail_wood 16",items = {
	"default:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:fence_wood 4",items = {
	"group:stick 2",
	"default:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:furnace",items = {
	"group:stone 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:glass",items = {
	"stairs:slab_glass 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:glass 3",items = {
	"stairs:stair_glass 4"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:glass",items = {
	"vessels:glass_fragments 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:glass",items = {
	"group:sand 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:goldblock",items = {
	"stairs:slab_goldblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:goldblock 3",items = {
	"stairs:stair_goldblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:goldblock",items = {
	"default:gold_ingot 9"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:gold_ingot",items = {
	"default:key 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:gold_ingot",items = {
	"default:skeleton_key 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:gold_ingot",items = {
	"default:gold_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:gold_ingot 9",items = {
	"default:goldblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:ice",items = {
	"stairs:slab_ice 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:ice 3",items = {
	"stairs:stair_ice 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:jungletree",items = {
	"stairs:slab_jungletree 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:jungletree 3",items = {
	"stairs:stair_jungletree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:junglewood",items = {
	"stairs:slab_junglewood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:junglewood 3",items = {
	"stairs:stair_junglewood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:junglewood 4",items = {
	"default:jungletree 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:ladder_steel 15",items = {
	"default:steel_ingot 7"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:ladder_wood 5",items = {
	"group:stick 7"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:large_cactus_seedling",items = {
	"default:cactus 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mese",items = {
	"default:mese_crystal 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mese_crystal",items = {
	"default:mese_crystal_fragment 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mese_crystal 9",items = {
	"default:mese 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mese_crystal_fragment 9",items = {
	"default:mese_crystal 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:meselamp",items = {
	"default:glass 1",
	"default:mese_crystal 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mese_post_light 3",items = {
	"default:mese_crystal 3",
	"group:wood 1",
	"default:glass 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mossycobble",items = {
	"stairs:slab_mossycobble 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:mossycobble 3",items = {
	"stairs:stair_mossycobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian",items = {
	"stairs:slab_obsidian 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian 3",items = {
	"stairs:stair_obsidian 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian",items = {
	"default:obsidian_shard 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_block",items = {
	"stairs:slab_obsidian_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_block 3",items = {
	"stairs:stair_obsidian_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_block 9",items = {
	"default:obsidian 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidianbrick",items = {
	"stairs:slab_obsidianbrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidianbrick 3",items = {
	"stairs:stair_obsidianbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidianbrick 4",items = {
	"default:obsidian 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_glass",items = {
	"stairs:slab_obsidian_glass 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_glass 3",items = {
	"stairs:stair_obsidian_glass 4"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:obsidian_glass",items = {
	"default:obsidian_shard 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:obsidian_shard 9",items = {
	"default:obsidian 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:paper",items = {
	"default:papyrus 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost",items = {
	"stairs:slab_permafrost 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost 3",items = {
	"stairs:stair_permafrost 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost_with_moss",items = {
	"stairs:slab_permafrost_with_moss 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost_with_moss 3",items = {
	"stairs:stair_permafrost_with_moss 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost_with_stones",items = {
	"stairs:slab_permafrost_with_stones 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:permafrost_with_stones 3",items = {
	"stairs:stair_permafrost_with_stones 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_bronze",items = {
	"group:stick 2",
	"default:bronze_ingot 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_diamond",items = {
	"default:diamond 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_mese",items = {
	"default:mese_crystal 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_steel",items = {
	"default:steel_ingot 3",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pick_wood",items = {
	"group:stick 2",
	"group:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_tree",items = {
	"stairs:slab_pine_tree 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_tree 3",items = {
	"stairs:stair_pine_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_wood",items = {
	"stairs:slab_pine_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_wood 3",items = {
	"stairs:stair_pine_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_wood",items = {
	"default:pine_bush_stem 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:pine_wood 4",items = {
	"default:pine_tree 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sand 4",items = {
	"default:sandstone 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone",items = {
	"stairs:slab_sandstone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone 3",items = {
	"stairs:stair_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone",items = {
	"default:sand 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone_block",items = {
	"stairs:slab_sandstone_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone_block 3",items = {
	"stairs:stair_sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstone_block 9",items = {
	"default:sandstone 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstonebrick",items = {
	"stairs:slab_sandstonebrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstonebrick 3",items = {
	"stairs:stair_sandstonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sandstonebrick 4",items = {
	"default:sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_bronze",items = {
	"group:stick 2",
	"default:bronze_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_diamond",items = {
	"default:diamond 1",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_mese",items = {
	"default:mese_crystal 1",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_steel",items = {
	"default:steel_ingot 1",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_stone",items = {
	"group:stick 2",
	"group:stone 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:shovel_wood",items = {
	"group:stick 2",
	"group:wood 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sign_wall_steel 3",items = {
	"default:steel_ingot 6",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sign_wall_wood 3",items = {
	"group:stick 1",
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sand 4",items = {
	"default:silver_sandstone 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone",items = {
	"stairs:slab_silver_sandstone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone 3",items = {
	"stairs:stair_silver_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone",items = {
	"default:silver_sand 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_block",items = {
	"stairs:slab_silver_sandstone_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_block 3",items = {
	"stairs:stair_silver_sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_block 9",items = {
	"default:silver_sandstone 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_brick",items = {
	"stairs:slab_silver_sandstone_brick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_brick 3",items = {
	"stairs:stair_silver_sandstone_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:silver_sandstone_brick 4",items = {
	"default:silver_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:skeleton_key",items = {
	"default:gold_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:snow 9",items = {
	"default:snowblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:snowblock",items = {
	"stairs:slab_snowblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:snowblock 3",items = {
	"stairs:stair_snowblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:snowblock",items = {
	"default:snow 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:steelblock",items = {
	"stairs:slab_steelblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:steelblock 3",items = {
	"stairs:stair_steelblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:steelblock",items = {
	"default:steel_ingot 9"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:steel_ingot",items = {
	"vessels:steel_bottle 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:steel_ingot",items = {
	"default:iron_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:steel_ingot 9",items = {
	"default:steelblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stick 4",items = {
	"group:wood 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stone",items = {
	"stairs:slab_stone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stone 3",items = {
	"stairs:stair_stone 4"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:stone",items = {
	"default:mossycobble 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:stone",items = {
	"default:cobble 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stone_block",items = {
	"stairs:slab_stone_block 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stone_block 3",items = {
	"stairs:stair_stone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stone_block 9",items = {
	"default:stone 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stonebrick",items = {
	"stairs:slab_stonebrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stonebrick 3",items = {
	"stairs:stair_stonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:stonebrick 4",items = {
	"default:stone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_bronze",items = {
	"group:stick 1",
	"default:bronze_ingot 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_diamond",items = {
	"default:diamond 2",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_mese",items = {
	"default:mese_crystal 2",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_steel",items = {
	"default:steel_ingot 2",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_stone",items = {
	"group:stick 1",
	"group:stone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:sword_wood",items = {
	"group:stick 1",
	"group:wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tinblock",items = {
	"stairs:slab_tinblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tinblock 3",items = {
	"stairs:stair_tinblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tinblock",items = {
	"default:tin_ingot 9"
},always_known = true})
crafting.register_recipe({type = furnace,output = "default:tin_ingot",items = {
	"default:tin_lump 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tin_ingot 9",items = {
	"default:tinblock 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:torch 4",items = {
	"default:coal_lump 1",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tree",items = {
	"stairs:slab_tree 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:tree 3",items = {
	"stairs:stair_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:wood",items = {
	"stairs:slab_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:wood 3",items = {
	"stairs:stair_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:wood",items = {
	"default:bush_stem 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "default:wood 4",items = {
	"default:tree 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:door_glass",items = {
	"default:glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:door_obsidian_glass",items = {
	"default:obsidian_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:door_steel",items = {
	"default:steel_ingot 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:door_wood",items = {
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:gate_acacia_wood_closed",items = {
	"group:stick 4",
	"default:acacia_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:gate_aspen_wood_closed",items = {
	"group:stick 4",
	"default:aspen_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:gate_junglewood_closed",items = {
	"group:stick 4",
	"default:junglewood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:gate_pine_wood_closed",items = {
	"group:stick 4",
	"default:pine_wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:gate_wood_closed",items = {
	"group:stick 4",
	"default:wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:japanese_door",items = {
	"default:paper 3",
	"group:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:prison_door",items = {
	"xpanes:bar_flat 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:rusty_prison_door",items = {
	"xpanes:rusty_bar_flat 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:screen_door",items = {
	"xpanes:chainlink_flat 2",
	"group:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:slide_door",items = {
	"group:wood 2",
	"default:paper 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:trapdoor 2",items = {
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:trapdoor_steel",items = {
	"default:steel_ingot 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "doors:woodglass_door",items = {
	"default:glass 2",
	"group:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:black 4",items = {
	"group:coal 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:black 4",items = {
	"group:flower,color_black 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:blue 2",items = {
	"dye:magenta 1",
	"dye:cyan 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:blue 4",items = {
	"group:flower,color_blue 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:brown 2",items = {
	"dye:black 1",
	"dye:orange 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:brown 2",items = {
	"dye:green 1",
	"dye:red 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:brown 4",items = {
	"group:flower,color_brown 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:cyan 2",items = {
	"dye:blue 1",
	"dye:green 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:cyan 4",items = {
	"group:flower,color_cyan 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_green 2",items = {
	"dye:black 1",
	"dye:green 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_green 4",items = {
	"group:flower,color_dark_green 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_grey 2",items = {
	"dye:grey 1",
	"dye:black 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_grey 2",items = {
	"dye:blue 1",
	"dye:orange 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_grey 2",items = {
	"dye:violet 1",
	"dye:yellow 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:dark_grey 4",items = {
	"group:flower,color_dark_grey 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:green 2",items = {
	"dye:dark_green 1",
	"dye:white 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:green 2",items = {
	"dye:yellow 1",
	"dye:cyan 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:green 2",items = {
	"dye:blue 1",
	"dye:yellow 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:green 4",items = {
	"group:flower,color_green 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:grey 2",items = {
	"dye:dark_grey 1",
	"dye:white 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:grey 2",items = {
	"dye:black 1",
	"dye:white 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:grey 4",items = {
	"group:flower,color_grey 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:magenta 2",items = {
	"dye:violet 1",
	"dye:pink 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:magenta 4",items = {
	"group:flower,color_magenta 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:orange 2",items = {
	"dye:red 1",
	"dye:yellow 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:orange 4",items = {
	"group:flower,color_orange 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:pink 2",items = {
	"dye:red 1",
	"dye:white 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:pink 4",items = {
	"group:flower,color_pink 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:red 2",items = {
	"dye:magenta 1",
	"dye:yellow 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:red 4",items = {
	"group:flower,color_red 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:violet 2",items = {
	"dye:blue 1",
	"dye:magenta 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:violet 2",items = {
	"dye:blue 1",
	"dye:red 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:violet 2",items = {
	"default:blueberries 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:violet 4",items = {
	"group:flower,color_violet 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:white 4",items = {
	"group:flower,color_white 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "dye:yellow 4",items = {
	"group:flower,color_yellow 1"
},always_known = true})
crafting.register_recipe({type = furnace,output = "farming:bread",items = {
	"farming:flour 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:flour",items = {
	"farming:wheat 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:hoe_steel",items = {
	"default:steel_ingot 2",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:hoe_stone",items = {
	"group:stick 2",
	"group:stone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:hoe_wood",items = {
	"group:stick 2",
	"group:wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:straw 3",items = {
	"farming:wheat 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:straw",items = {
	"stairs:slab_straw 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:straw 3",items = {
	"stairs:stair_straw 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:string 2",items = {
	"farming:cotton 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "farming:wheat 3",items = {
	"farming:straw 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "fireflies:bug_net",items = {
	"farming:string 4",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "fireflies:firefly_bottle",items = {
	"vessels:glass_bottle 1",
	"fireflies:firefly 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "fire:flint_and_steel",items = {
	"default:flint 1",
	"default:steel_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "map:mapping_kit",items = {
	"group:stick 1",
	"dye:black 1",
	"default:steel_ingot 2",
	"default:paper 3",
	"group:wood 1",
	"default:glass 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "orientation:cgpsmap",items = {
	"orientation:cgpsmap_marked 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "orientation:cgpsmap",items = {
	"default:paper 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:chest",items = {
	"default:chest 1",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:chest",items = {
	"default:copper_ingot 1",
	"group:wood 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:door_steel",items = {
	"doors:door_steel 1",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:door_steel",items = {
	"default:steel_ingot 5",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:door_wood",items = {
	"default:copper_ingot 1",
	"doors:door_wood 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:door_wood",items = {
	"default:copper_ingot 1",
	"group:wood 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:protect",items = {
	"protector:protect2 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:protect",items = {
	"default:gold_ingot 1",
	"default:stone 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:protect2",items = {
	"protector:protect 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:tool",items = {
	"default:steel_ingot 8",
	"protector:protect 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:trapdoor",items = {
	"doors:trapdoor 1",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:trapdoor 2",items = {
	"default:copper_ingot 1",
	"group:wood 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:trapdoor_steel",items = {
	"doors:trapdoor_steel 1",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "protector:trapdoor_steel",items = {
	"default:steel_ingot 3",
	"default:copper_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "realchess:chessboard",items = {
	"dye:black 2",
	"dye:white 1",
	"stairs:slab_wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "screwdriver:screwdriver",items = {
	"default:steel_ingot 1",
	"group:stick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_acacia_tree 6",items = {
	"default:acacia_tree 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_acacia_wood 6",items = {
	"default:acacia_wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_aspen_tree 6",items = {
	"default:aspen_tree 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_aspen_wood 6",items = {
	"default:aspen_wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_barrel 6",items = {
	"xdecor:barrel 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_brick 6",items = {
	"default:brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_bronzeblock 6",items = {
	"default:bronzeblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_cactus 6",items = {
	"default:cactus 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_cactusbrick 6",items = {
	"xdecor:cactusbrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_coalblock 6",items = {
	"default:coalblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_coalstone_tile 6",items = {
	"xdecor:coalstone_tile 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_cobble 6",items = {
	"default:cobble 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_copperblock 6",items = {
	"default:copperblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_coral_brown 6",items = {
	"default:coral_brown 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_coral_orange 6",items = {
	"default:coral_orange 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_coral_skeleton 6",items = {
	"default:coral_skeleton 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_cobble 6",items = {
	"default:desert_cobble 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_sandstone 6",items = {
	"default:desert_sandstone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_sandstone_block 6",items = {
	"default:desert_sandstone_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_sandstone_brick 6",items = {
	"default:desert_sandstone_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_stone 6",items = {
	"default:desert_stone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_stone_block 6",items = {
	"default:desert_stone_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desert_stonebrick 6",items = {
	"default:desert_stonebrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_desertstone_tile 6",items = {
	"xdecor:desertstone_tile 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_diamondblock 6",items = {
	"default:diamondblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_glass 6",items = {
	"default:glass 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_goldblock 6",items = {
	"default:goldblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_hard_clay 6",items = {
	"xdecor:hard_clay 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_ice 6",items = {
	"default:ice 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_jungletree 6",items = {
	"default:jungletree 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_junglewood 6",items = {
	"default:junglewood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_moonbrick 6",items = {
	"xdecor:moonbrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_mossycobble 6",items = {
	"default:mossycobble 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_obsidian 6",items = {
	"default:obsidian 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_obsidian_block 6",items = {
	"default:obsidian_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_obsidianbrick 6",items = {
	"default:obsidianbrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_obsidian_glass 6",items = {
	"default:obsidian_glass 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_packed_ice 6",items = {
	"xdecor:packed_ice 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_permafrost 6",items = {
	"default:permafrost 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_permafrost_with_moss 6",items = {
	"default:permafrost_with_moss 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_permafrost_with_stones 6",items = {
	"default:permafrost_with_stones 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_pine_tree 6",items = {
	"default:pine_tree 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_pine_wood 6",items = {
	"default:pine_wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_sandstone 6",items = {
	"default:sandstone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_sandstone_block 6",items = {
	"default:sandstone_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_sandstonebrick 6",items = {
	"default:sandstonebrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_silver_sandstone 6",items = {
	"default:silver_sandstone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_silver_sandstone_block 6",items = {
	"default:silver_sandstone_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_silver_sandstone_brick 6",items = {
	"default:silver_sandstone_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_snowblock 6",items = {
	"default:snowblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_steelblock 6",items = {
	"default:steelblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_stone 6",items = {
	"default:stone 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_stone_block 6",items = {
	"default:stone_block 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_stonebrick 6",items = {
	"default:stonebrick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_stone_rune 6",items = {
	"xdecor:stone_rune 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_stone_tile 6",items = {
	"xdecor:stone_tile 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_straw 6",items = {
	"farming:straw 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_tinblock 6",items = {
	"default:tinblock 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_tree 6",items = {
	"default:tree 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_wood 6",items = {
	"default:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_woodframed_glass 6",items = {
	"xdecor:woodframed_glass 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:slab_wood_tile 6",items = {
	"xdecor:wood_tile 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_acacia_tree 8",items = {
	"default:acacia_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_acacia_wood 8",items = {
	"default:acacia_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_aspen_tree 8",items = {
	"default:aspen_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_aspen_wood 8",items = {
	"default:aspen_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_barrel 8",items = {
	"xdecor:barrel 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_brick 8",items = {
	"default:brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_bronzeblock 8",items = {
	"default:bronzeblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_cactus 8",items = {
	"default:cactus 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_cactusbrick 8",items = {
	"xdecor:cactusbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_coalblock 8",items = {
	"default:coalblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_coalstone_tile 8",items = {
	"xdecor:coalstone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_cobble 8",items = {
	"default:cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_copperblock 8",items = {
	"default:copperblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_coral_brown 8",items = {
	"default:coral_brown 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_coral_orange 8",items = {
	"default:coral_orange 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_coral_skeleton 8",items = {
	"default:coral_skeleton 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_cobble 8",items = {
	"default:desert_cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_sandstone 8",items = {
	"default:desert_sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_sandstone_block 8",items = {
	"default:desert_sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_sandstone_brick 8",items = {
	"default:desert_sandstone_brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_stone 8",items = {
	"default:desert_stone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_stone_block 8",items = {
	"default:desert_stone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desert_stonebrick 8",items = {
	"default:desert_stonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_desertstone_tile 8",items = {
	"xdecor:desertstone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_diamondblock 8",items = {
	"default:diamondblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_glass 8",items = {
	"default:glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_goldblock 8",items = {
	"default:goldblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_hard_clay 8",items = {
	"xdecor:hard_clay 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_ice 8",items = {
	"default:ice 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_acacia_tree 7",items = {
	"default:acacia_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_acacia_wood 7",items = {
	"default:acacia_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_aspen_tree 7",items = {
	"default:aspen_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_aspen_wood 7",items = {
	"default:aspen_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_barrel 7",items = {
	"xdecor:barrel 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_brick 7",items = {
	"default:brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_bronzeblock 7",items = {
	"default:bronzeblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_cactus 7",items = {
	"default:cactus 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_cactusbrick 7",items = {
	"xdecor:cactusbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_coalblock 7",items = {
	"default:coalblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_coalstone_tile 7",items = {
	"xdecor:coalstone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_cobble 7",items = {
	"default:cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_copperblock 7",items = {
	"default:copperblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_coral_brown 7",items = {
	"default:coral_brown 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_coral_orange 7",items = {
	"default:coral_orange 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_coral_skeleton 7",items = {
	"default:coral_skeleton 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_cobble 7",items = {
	"default:desert_cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_sandstone 7",items = {
	"default:desert_sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_sandstone_block 7",items = {
	"default:desert_sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_sandstone_brick 7",items = {
	"default:desert_sandstone_brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_stone 7",items = {
	"default:desert_stone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_stone_block 7",items = {
	"default:desert_stone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desert_stonebrick 7",items = {
	"default:desert_stonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_desertstone_tile 7",items = {
	"xdecor:desertstone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_diamondblock 7",items = {
	"default:diamondblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_glass 7",items = {
	"default:glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_goldblock 7",items = {
	"default:goldblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_hard_clay 7",items = {
	"xdecor:hard_clay 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_ice 7",items = {
	"default:ice 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_jungletree 7",items = {
	"default:jungletree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_junglewood 7",items = {
	"default:junglewood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_moonbrick 7",items = {
	"xdecor:moonbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_mossycobble 7",items = {
	"default:mossycobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_obsidian 7",items = {
	"default:obsidian 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_obsidian_block 7",items = {
	"default:obsidian_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_obsidianbrick 7",items = {
	"default:obsidianbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_obsidian_glass 7",items = {
	"default:obsidian_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_packed_ice 7",items = {
	"xdecor:packed_ice 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_permafrost 7",items = {
	"default:permafrost 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_permafrost_with_moss 7",items = {
	"default:permafrost_with_moss 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_permafrost_with_stones 7",items = {
	"default:permafrost_with_stones 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_pine_tree 7",items = {
	"default:pine_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_pine_wood 7",items = {
	"default:pine_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_sandstone 7",items = {
	"default:sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_sandstone_block 7",items = {
	"default:sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_sandstonebrick 7",items = {
	"default:sandstonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_silver_sandstone 7",items = {
	"default:silver_sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_silver_sandstone_block 7",items = {
	"default:silver_sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_silver_sandstone_brick 7",items = {
	"default:silver_sandstone_brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_snowblock 7",items = {
	"default:snowblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_steelblock 7",items = {
	"default:steelblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_stone 7",items = {
	"default:stone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_stone_block 7",items = {
	"default:stone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_stonebrick 7",items = {
	"default:stonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_stone_rune 7",items = {
	"xdecor:stone_rune 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_stone_tile 7",items = {
	"xdecor:stone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_straw 7",items = {
	"farming:straw 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_tinblock 7",items = {
	"default:tinblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_tree 7",items = {
	"default:tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_wood 7",items = {
	"default:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_woodframed_glass 7",items = {
	"xdecor:woodframed_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_inner_wood_tile 7",items = {
	"xdecor:wood_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_jungletree 8",items = {
	"default:jungletree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_junglewood 8",items = {
	"default:junglewood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_moonbrick 8",items = {
	"xdecor:moonbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_mossycobble 8",items = {
	"default:mossycobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_obsidian 8",items = {
	"default:obsidian 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_obsidian_block 8",items = {
	"default:obsidian_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_obsidianbrick 8",items = {
	"default:obsidianbrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_obsidian_glass 8",items = {
	"default:obsidian_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_acacia_tree 6",items = {
	"default:acacia_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_acacia_wood 6",items = {
	"default:acacia_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_aspen_tree 6",items = {
	"default:aspen_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_aspen_wood 6",items = {
	"default:aspen_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_barrel 6",items = {
	"xdecor:barrel 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_brick 6",items = {
	"default:brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_bronzeblock 6",items = {
	"default:bronzeblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_cactus 6",items = {
	"default:cactus 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_cactusbrick 6",items = {
	"xdecor:cactusbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_coalblock 6",items = {
	"default:coalblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_coalstone_tile 6",items = {
	"xdecor:coalstone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_cobble 6",items = {
	"default:cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_copperblock 6",items = {
	"default:copperblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_coral_brown 6",items = {
	"default:coral_brown 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_coral_orange 6",items = {
	"default:coral_orange 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_coral_skeleton 6",items = {
	"default:coral_skeleton 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_cobble 6",items = {
	"default:desert_cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_sandstone 6",items = {
	"default:desert_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_sandstone_block 6",items = {
	"default:desert_sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_sandstone_brick 6",items = {
	"default:desert_sandstone_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_stone 6",items = {
	"default:desert_stone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_stone_block 6",items = {
	"default:desert_stone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desert_stonebrick 6",items = {
	"default:desert_stonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_desertstone_tile 6",items = {
	"xdecor:desertstone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_diamondblock 6",items = {
	"default:diamondblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_glass 6",items = {
	"default:glass 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_goldblock 6",items = {
	"default:goldblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_hard_clay 6",items = {
	"xdecor:hard_clay 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_ice 6",items = {
	"default:ice 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_jungletree 6",items = {
	"default:jungletree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_junglewood 6",items = {
	"default:junglewood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_moonbrick 6",items = {
	"xdecor:moonbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_mossycobble 6",items = {
	"default:mossycobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_obsidian 6",items = {
	"default:obsidian 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_obsidian_block 6",items = {
	"default:obsidian_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_obsidianbrick 6",items = {
	"default:obsidianbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_obsidian_glass 6",items = {
	"default:obsidian_glass 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_packed_ice 6",items = {
	"xdecor:packed_ice 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_permafrost 6",items = {
	"default:permafrost 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_permafrost_with_moss 6",items = {
	"default:permafrost_with_moss 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_permafrost_with_stones 6",items = {
	"default:permafrost_with_stones 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_pine_tree 6",items = {
	"default:pine_tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_pine_wood 6",items = {
	"default:pine_wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_sandstone 6",items = {
	"default:sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_sandstone_block 6",items = {
	"default:sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_sandstonebrick 6",items = {
	"default:sandstonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_silver_sandstone 6",items = {
	"default:silver_sandstone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_silver_sandstone_block 6",items = {
	"default:silver_sandstone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_silver_sandstone_brick 6",items = {
	"default:silver_sandstone_brick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_snowblock 6",items = {
	"default:snowblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_steelblock 6",items = {
	"default:steelblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_stone 6",items = {
	"default:stone 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_stone_block 6",items = {
	"default:stone_block 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_stonebrick 6",items = {
	"default:stonebrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_stone_rune 6",items = {
	"xdecor:stone_rune 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_stone_tile 6",items = {
	"xdecor:stone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_straw 6",items = {
	"farming:straw 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_tinblock 6",items = {
	"default:tinblock 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_tree 6",items = {
	"default:tree 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_wood 6",items = {
	"default:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_woodframed_glass 6",items = {
	"xdecor:woodframed_glass 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_outer_wood_tile 6",items = {
	"xdecor:wood_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_packed_ice 8",items = {
	"xdecor:packed_ice 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_permafrost 8",items = {
	"default:permafrost 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_permafrost_with_moss 8",items = {
	"default:permafrost_with_moss 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_permafrost_with_stones 8",items = {
	"default:permafrost_with_stones 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_pine_tree 8",items = {
	"default:pine_tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_pine_wood 8",items = {
	"default:pine_wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_sandstone 8",items = {
	"default:sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_sandstone_block 8",items = {
	"default:sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_sandstonebrick 8",items = {
	"default:sandstonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_silver_sandstone 8",items = {
	"default:silver_sandstone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_silver_sandstone_block 8",items = {
	"default:silver_sandstone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_silver_sandstone_brick 8",items = {
	"default:silver_sandstone_brick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_snowblock 8",items = {
	"default:snowblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_steelblock 8",items = {
	"default:steelblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_stone 8",items = {
	"default:stone 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_stone_block 8",items = {
	"default:stone_block 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_stonebrick 8",items = {
	"default:stonebrick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_stone_rune 8",items = {
	"xdecor:stone_rune 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_stone_tile 8",items = {
	"xdecor:stone_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_straw 8",items = {
	"farming:straw 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_tinblock 8",items = {
	"default:tinblock 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_tree 8",items = {
	"default:tree 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_wood 8",items = {
	"default:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_woodframed_glass 8",items = {
	"xdecor:woodframed_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "stairs:stair_wood_tile 8",items = {
	"xdecor:wood_tile 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "tnt:gunpowder 5",items = {
	"default:coal_lump 1",
	"default:gravel 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "tnt:tnt",items = {
	"tnt:tnt_stick 9"
},always_known = true})
crafting.register_recipe({type = "inv",output = "tnt:tnt_stick 2",items = {
	"default:paper 1",
	"tnt:gunpowder 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:drinking_glass 14",items = {
	"default:glass 7"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:glass_bottle 10",items = {
	"default:glass 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:glass_fragments",items = {
	"vessels:drinking_glass 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:glass_fragments",items = {
	"vessels:glass_bottle 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:shelf",items = {
	"group:vessel 3",
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "vessels:steel_bottle 5",items = {
	"default:steel_ingot 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "walls:cobble 6",items = {
	"default:cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "walls:desertcobble 6",items = {
	"default:desert_cobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "walls:mossycobble 6",items = {
	"default:mossycobble 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:black",items = {
	"group:wool 1",
	"group:dye,color_black 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:blue",items = {
	"group:dye,color_blue 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:brown",items = {
	"group:wool 1",
	"group:dye,color_brown 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:cyan",items = {
	"group:wool 1",
	"group:dye,color_cyan 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:dark_green",items = {
	"group:dye,color_dark_green 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:dark_grey",items = {
	"group:wool 1",
	"group:dye,color_dark_grey 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:green",items = {
	"group:wool 1",
	"group:dye,color_green 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:grey",items = {
	"group:wool 1",
	"group:dye,color_grey 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:magenta",items = {
	"group:dye,color_magenta 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:orange",items = {
	"group:dye,color_orange 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:pink",items = {
	"group:dye,color_pink 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:red",items = {
	"group:wool 1",
	"group:dye,color_red 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:violet",items = {
	"group:wool 1",
	"group:dye,color_violet 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:white",items = {
	"farming:cotton 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:white",items = {
	"group:dye,color_white 1",
	"group:wool 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "wool:yellow",items = {
	"group:wool 1",
	"group:dye,color_yellow 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:baricade",items = {
	"group:stick 4",
	"default:steel_ingot 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:barrel",items = {
	"stairs:slab_barrel 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:barrel 3",items = {
	"stairs:stair_barrel 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:barrel",items = {
	"default:iron_lump 2",
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:bowl 3",items = {
	"group:wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cabinet",items = {
	"doors:trapdoor 2",
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cabinet_half 2",items = {
	"xdecor:cabinet 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cactusbrick",items = {
	"stairs:slab_cactusbrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cactusbrick 3",items = {
	"stairs:stair_cactusbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cactusbrick",items = {
	"default:cactus 1",
	"default:brick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:candle",items = {
	"default:torch 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cauldron_empty",items = {
	"default:iron_lump 7"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:chair",items = {
	"group:stick 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:coalstone_tile",items = {
	"stairs:slab_coalstone_tile 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:coalstone_tile 3",items = {
	"stairs:stair_coalstone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:coalstone_tile 4",items = {
	"default:stone 2",
	"default:coalblock 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cobweb",items = {
	"farming:cotton 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:curtain_red 4",items = {
	"wool:red 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cushion 3",items = {
	"wool:red 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:cushion_block",items = {
	"xdecor:cushion 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:desertstone_tile",items = {
	"stairs:slab_desertstone_tile 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:desertstone_tile 3",items = {
	"stairs:stair_desertstone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:desertstone_tile",items = {
	"default:desert_cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:empty_shelf",items = {
	"group:wood 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:enchantment_table",items = {
	"default:book 1",
	"default:diamond 2",
	"default:obsidian 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:enderchest",items = {
	"default:chest 1",
	"default:obsidian 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:hammer",items = {
	"default:steel_ingot 2",
	"group:stick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:hard_clay",items = {
	"stairs:slab_hard_clay 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:hard_clay 3",items = {
	"stairs:stair_hard_clay 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:hard_clay",items = {
	"default:clay 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:hive",items = {
	"group:stick 6",
	"default:paper 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:iron_lightbox",items = {
	"default:torch 2",
	"default:glass 1",
	"xpanes:bar_flat 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:itemframe",items = {
	"group:stick 8",
	"default:paper 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:ivy 4",items = {
	"group:leaves 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:lantern",items = {
	"default:torch 1",
	"default:iron_lump 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:lever_off",items = {
	"group:stick 1",
	"group:stone 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:mailbox",items = {
	"default:steel_ingot 6",
	"default:paper 1",
	"dye:red 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:moonbrick",items = {
	"stairs:slab_moonbrick 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:moonbrick 3",items = {
	"stairs:stair_moonbrick 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:moonbrick",items = {
	"default:stone 1",
	"default:brick 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:multishelf",items = {
	"group:book 1",
	"group:wood 6",
	"group:vessel 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:packed_ice",items = {
	"stairs:slab_packed_ice 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:packed_ice 3",items = {
	"stairs:stair_packed_ice 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:packed_ice",items = {
	"default:ice 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:painting_1",items = {
	"group:dye 1",
	"default:sign_wall_wood 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_dandelion_white",items = {
	"flowers:dandelion_white 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_dandelion_yellow",items = {
	"flowers:dandelion_yellow 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_geranium",items = {
	"flowers:geranium 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_rose",items = {
	"flowers:rose 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_tulip",items = {
	"flowers:tulip 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:potted_viola",items = {
	"flowers:viola 1",
	"default:clay_brick 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:pressure_stone_off",items = {
	"group:stone 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:pressure_wood_off",items = {
	"group:wood 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:rope",items = {
	"farming:string 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stonepath 16",items = {
	"stairs:slab_cobble 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_rune",items = {
	"stairs:slab_stone_rune 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_rune 3",items = {
	"stairs:stair_stone_rune 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_rune 4",items = {
	"default:stone 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_tile",items = {
	"stairs:slab_stone_tile 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_tile 3",items = {
	"stairs:stair_stone_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:stone_tile 2",items = {
	"default:cobble 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:table",items = {
	"group:stick 2",
	"stairs:slab_wood 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:tatami",items = {
	"farming:wheat 3"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:trampoline",items = {
	"farming:string 3",
	"default:steel_ingot 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:tv",items = {
	"default:steel_ingot 6",
	"default:copper_ingot 2",
	"default:glass 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:wooden_lightbox",items = {
	"default:glass 1",
	"group:stick 6",
	"default:torch 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:woodframed_glass",items = {
	"stairs:slab_woodframed_glass 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:woodframed_glass 3",items = {
	"stairs:stair_woodframed_glass 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:woodframed_glass",items = {
	"group:stick 8",
	"default:glass 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:wood_tile",items = {
	"stairs:slab_wood_tile 2"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:wood_tile 3",items = {
	"stairs:stair_wood_tile 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:wood_tile 2",items = {
	"group:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xdecor:workbench",items = {
	"group:wood 4"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:bamboo_frame_flat 16",items = {
	"farming:cotton 1",
	"default:papyrus 8"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:bar_flat 16",items = {
	"default:steel_ingot 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:chainlink_flat 16",items = {
	"default:steel_ingot 5"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:obsidian_pane_flat 16",items = {
	"default:obsidian_glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:pane_flat 16",items = {
	"default:glass 6"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:rusty_bar_flat 16",items = {
	"default:steel_ingot 6",
	"default:dirt 1"
},always_known = true})
crafting.register_recipe({type = "inv",output = "xpanes:wood_frame_flat 16",items = {
	"group:stick 5",
	"group:wood 4"
},always_known = true})
]]--

-- Wood basics
crafting.register_recipe({type = "inv",output = "default:stick 4",items = {
	"group:wood 1"
},always_known = true})

crafting.register_recipe({type = "inv",output = "default:wood 4",items = {
	"group:tree 1"
},always_known = true})


-- Wood structures
crafting.register_recipe({type = "inv",output = "xpanes:wood_frame_flat 16",items = {
	"group:stick 5",
	"group:wood 4"
},always_known = false})
crafting.register_recipe({type = "inv",output = "doors:door_wood",items = {
	"group:wood 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "stairs:stair_wood 8",items = {
	"default:wood 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:ladder_wood 5",items = {
	"group:stick 7"
},always_known = false})

-- Stone structures
crafting.register_recipe({type = "inv",output = "stairs:stair_cobble 8",items = {
	"default:cobble 6"
},always_known = false})
crafting.register_recipe({type = "inv",output = "stairs:slab_cobble 6",items = {
	"default:cobble 3"
},always_known = false})
-- Tools
crafting.register_recipe({type = "inv",output = "default:axe_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:shovel_stone",items = {
	"group:stick 2",
	"group:stone 1"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:pick_stone",items = {
	"group:stick 2",
	"group:stone 3"
},always_known = false})
crafting.register_recipe({type = "inv",output = "default:torch 4",items = {
	"default:coal_lump 1",
	"group:stick 1"
},always_known = false})


-- mesecons
crafting.register_recipe({type = "inv",output = "mesecons:wire_00000000_off 4",items = {
	"default:iron_lump 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_lightstone:lightstone_yellow_off 1",items = {
	"group:sand 1",
  "group:mesecon_conductor_craftable 1",
  "group:wood 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_pressureplates:pressure_plate_wood_off 1",items = {
	"group:wood 1",
  "group:mesecon_conductor_craftable 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_walllever:wall_lever_off 1",items = {
  "stairs:slab_cobble 1",
  "group:mesecon_conductor_craftable 1",
  "group:wood 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_torch:mesecon_torch_on 1",items = {
  "default:torch 1",
  "group:mesecon_conductor_craftable 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_gates:not_off 1",items = {
  "mesecons_torch:mesecon_torch_on 1",
  "group:mesecon_conductor_craftable 1"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_gates:and_off 1",items = {
  "mesecons_torch:mesecon_torch_on 1",
  "group:mesecon_conductor_craftable 2"
},always_known = false})

crafting.register_recipe({type = "inv",output = "mesecons_pistons:piston_sticky_off 1",items = {
  "mesecons_torch:mesecon_torch_on 1",
  "group:mesecon_conductor_craftable 2",
  "group:wood 1",
  "default:iron_lump 1"
},always_known = false})

crafting.register_recipe({type = "furnace",output = "default:steel_ingot",items = {
	"default:iron_lump 1"
},always_known = true})
