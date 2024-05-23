Physics = {
	gravity = 0.5,
}
Physics.__index = Physics

--- Physics class constructor
-- @return table: The physics table
function Physics:new()
	local instance = setmetatable({}, Physics)
	instance.entities = {}
	return instance
end

--- Entity class constructor
-- @param entity Entity: The Entity instance to add
function Physics:addEntity(entity)
	table.insert(self.entities, entity)
end

--- Entity class constructor
-- @param dt number: The change in time
function Physics:update(dt)
	-- Apply gravity
	for _, entity in ipairs(self.entities) do
		entity.dy = entity.dy + self.gravity
		entity.y = entity.y + entity.dy
	end

	-- Update forces
end
