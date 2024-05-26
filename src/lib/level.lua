local json = require("lib/json")
local Level = {}
Level.__index = Level

function Level:new()
	local instance = setmetatable({}, Level)
	return instance
end

--- Get the tiles in the level and write them
function Level:writeTiles() end

--- Get the entities in the level and write them
function Level:writeEntites() end

--- Get the flags in the level and write them
function Level:writeFlags() end

function Level:loadLevel(path)
	-- Load the file's content in
	local file = io.open(path, "r")
	if not file then
		return nil, "Could not open file: " .. path
	end
	local content = file:read("*all")
	file:close()

	-- Decode it
	local loaded_level = json.decode(content)
	print("loaded: " .. loaded_level.level_properties.name)
end

return Level
