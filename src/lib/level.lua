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

--- Get the tiles in the level and load them
function Level:loadTiles(tileTable)
	print("loading tiles...")
end

--- Get the entities in the level and load them
function Level:loadEntites(entityTable)
	print("loading entities...")
end

--- Get the flags in the level and load them
function Level:loadFlags() end

---Load the level from JSON format
---@param path string The path to the file, from the root
---@return boolean success If the loading succeeded
function Level:loadLevel(path)
	-- Load the file's content in
	local file = io.open(path, "r")
	if not file then
		return false
	end
	local content = file:read("*all")
	file:close()

	-- Decode it
	self.data = json.decode(content)
	print("loaded: " .. self.data.properties.name)

	for key, value in pairs(self.data) do
		if key == "tiles" then
			self:loadTiles(value)
		elseif key == "entities" then
			self:loadEntites(value)
		end
	end

	return true
end

return Level
