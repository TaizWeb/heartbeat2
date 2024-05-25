local Entity = {}
Entity.__index = Entity

--- Entity class constructor
-- @param name string: The name of the entity
-- @return table: The entity table
-- TODO: Maybe change this to take in a table for named parameters?
function Entity:new(id, width, height)
	local instance = setmetatable({}, Entity)
	instance.id = id or "Unnamed"
	-- Positioning
	instance.x = 0
	instance.y = 0
	-- Hitbox Dimensions
	instance.width = width
	instance.height = height
	-- The change in speed
	instance.dx = 0
	instance.dy = 0
	instance.components = {}
	return instance
end

function Entity:addComponent(component)
	table.insert(self.components, component)
	component.parent = self
	component:update()
end

function Entity:remove()
	-- Remove the components
	for _, component in ipairs(self.components) do
		component:remove()
	end
	-- Destroy all fields to GC can eat it
	for k in pairs(self) do
		self[k] = nil
	end
end

function Entity:addTexture(texturePath)
	-- I dunno do some loading stuff here
end

--- Draw the entity to the screen
-- @param name string: The name of the entity
function Entity:draw()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	-- Old Heartbeat code below, should wait until Camera is done
	-- In fact, it would be best to have a way to automate the camera coords system
	-- love.graphics.rectangle("fill", Camera.convert("x", object.x), Camera.convert("y", object.y), object.width, object.height)
end

function Entity:update()
	-- Update all the components
	for _, component in ipairs(self.components) do
		component:update()
	end
end

return Entity
