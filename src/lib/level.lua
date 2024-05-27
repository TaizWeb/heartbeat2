local json = require("lib/json")
local Entities = require("entities")
local Entity = require("lib/entity")
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

---Get the entities in the level and load them
---@param entityTable table The entity table from the level JSON
function Level:loadEntites(entityTable)
	print("loading entities...")
	for _, entity in ipairs(entityTable) do
		Level:addEntity(entity.id, entity.x_position, entity.y_position)
	end
end

--- Get the flags in the level and load them
function Level:loadFlags() end

---Adds an entity to the level
---@param id string The ID of the entity
---@param x_pos number The x position
---@param y_pos number The x position
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

function Level:render()
	for _, entity in ipairs(self.data.entities) do
		entity:draw()
		entity:update()
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
