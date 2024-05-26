local physics = require("lib/physics")
local Entities = {
	boxman = {
		id = "boxman",
		width = 50,
		height = 50,
		components = { physics:new() },
	},
}

return Entities
