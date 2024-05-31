local json = require("lib/json")
local Entity = require("lib/entity")
local Tile = require("lib/tile")
local Entities = require("entities")
local Tiles = require("tiles")

local Level = {
	data = {
		entities = {},
		tiles = {},
	},
}
Level.__index = Level

function Level:new()
	local instance = setmetatable({}, Level)
	return instance
end

---Write the current Level datastructure to a JSON file
---@param filename string The filename to write to
---@return boolean status Whether or not the write was successful
function Level:writeLevel(filename)
	-- Grab the level object and convert it to a JSON string
	-- local levelTable = Level.data
	local levelJSON = json.encode(self.data)
	local file, err = io.open(filename, "a")

	-- Write the file
	if not file then
		print("Could not open file: " .. err)
		return false
	end
	file:write(levelJSON)
	file:close()

	return true
end

---Get the tiles in the level and load them
---@param tileTable table The tile table from the level JSON
function Level:loadTiles(tileTable)
	print("loading tiles...")
	for _, tile in ipairs(tileTable) do
		Level:addTile(tile.id, tile.x_position, tile.y_position)
	end
end

---Get the entities in the level and load them
---@param entityTable table The entity table from the level JSON
function Level:loadEntites(entityTable)
	print("loading entities...")
	for _, entity in ipairs(entityTable) do
		Level:addEntity(entity.id, entity.x_position, entity.y_position)
	end
end

---Adds an entity to the level
---@param id string The ID of the entity
---@param x_pos number The x position
---@param y_pos number The y position
function Level:addEntity(id, x_pos, y_pos)
	-- Get the entity's data table
	local entityRef = Entities[id]
	-- Create the entity
	local entityInstance = Entity:new(entityRef.id, entityRef.width, entityRef.height)
	entityInstance.x = x_pos
	entityInstance.y = y_pos
	-- Add the components
	for _, component in ipairs(entityRef.components) do
		local componentInstance = component:new()
		entityInstance:addComponent(componentInstance)
	end
	-- Insert it into the Level's entity table
	table.insert(self.data.entities, entityInstance)
end

---Adds an tile to the level
---@param id string The ID of the tile
---@param x_pos number The x position
---@param y_pos number The y position
function Level:addTile(id, x_pos, y_pos)
	-- Get the entity's data table
	local tileRef = Tiles[id]
	-- Create the entity
	local tileInstance = Tile:new(tileRef.id, tileRef.width, tileRef.height)
	tileInstance.x = x_pos
	tileInstance.y = y_pos

	-- Insert it into the Level's entity table
	table.insert(self.data.tiles, tileInstance)
end

---Render the level, to be done on a per-frame basis
function Level:render()
	-- Entity rendering
	for _, entity in ipairs(self.data.entities) do
		entity:draw()
		entity:update()
	end

	-- Tile rendering
	for _, tile in ipairs(self.data.tiles) do
		tile:draw()
		tile:update()
	end
end

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

	-- Create the objects
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
