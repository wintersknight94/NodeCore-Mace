-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------

local modname = minetest.get_current_modname()

local function macecaps(lv)
	return nodecore.toolcaps({
			uses = 2.5,
			snappy = lv - 1,
			choppy = lv,
			crumbly = lv,
			cracky = lv,
			thumpy = lv + 2
		})
end
nodecore.register_lode("mace", {
		type = "tool",
		description = "## Lode Mace",
		inventory_image = modname.. "_#.png^[mask:" .. modname .. "_mace.png",
		stack_max = 1,
		light_source = 3,
		tool_capabilities = macecaps(4),
		bytemper = function(t, d)
			if t.name == "tempered" then
				d.tool_capabilities = macecaps(5)
			elseif t.name == "hot" then
				d.tool_capabilities = macecaps(3)
			end
		end,
		tool_wears_to = modname.. ":prill_# 7"
	})

nodecore.register_craft({
		label = "anvil making lode mace",
		action = "pummel",
		toolgroups = {thumpy = 3},
		indexkeys = {modname.. ":block_annealed"},
		nodes = {
			{
				match = {name = modname.. ":block_annealed"},
				replace = "air"
			},
			{
				y = -1,
				match = {name = modname.. ":rod_annealed"},
				replace = "air"
			},
			{
				y = -2,
				match = modname.. ":block_tempered"
			}
		},
		items = {
			modname.. ":mace_annealed"
		}
	})
nodecore.register_craft({
	label = "recycle lode mace",
	action = "pummel",
	toolgroups = {choppy = 3},
	indexkeys = {modname.. ":mace_hot"},
	nodes = {
		{
			match = modname.. ":mace_hot",
			replace = "air"
		}
	},
	items = {
		{name = modname.. ":prill_hot", count = 8, scatter = 3},
		{name = modname.. ":rod_hot"}
	},
	item_scatter = 3
})
