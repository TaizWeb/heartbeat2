local Entity = require("lib/entity")

local Tile = setmetatable({}, { __index = Entity })
Tile.__index = Tile

---Tile class constructor
---@param id string The unique ID of the tile
---@param width number The width of the tile
---@param height number The width of the tile
---@return table tile The tile object
function Tile:new(id, width, height)
	local instance = Entity.new(self, id, width, height)
	setmetatable(instance, Tile)
	return instance
end

return Tile
