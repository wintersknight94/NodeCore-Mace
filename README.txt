<><><> NOT A MOD <><><>
This file is intended to be merged with 'nc_lode'
It has to be manually merged, it cannot be loaded as a mod in the mod menu.
nc_lode/init.lua has to be edited, simply add the line below.

include("mace")



If you want the maces to be lux infusable, add the line below to the bottom of nc_lux/tools.lua

mktool("mace", {uses = 2.25})