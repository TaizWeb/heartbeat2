local Entity = {}
Entity.__index = Entity

---Entity class constructor
---@param id string The unique ID of the entity
---@param width number The width of the entity
---@param height number The width of the entity
---@return table entity The entity object
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

---Adds a new component (e.x. physics) to the entity
---@param component table The component to add
function Entity:addComponent(component)
	table.insert(self.components, component)
	component.parent = self
	component:update()
end

---Remove the entity from the level
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

---Draw the entity to the screen
function Entity:draw()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	-- Old Heartbeat code below, should wait until Camera is done
	-- In fact, it would be best to have a way to automate the camera coords system
	-- love.graphics.rectangle("fill", Camera.convert("x", object.x), Camera.convert("y", object.y), object.width, object.height)
end

---Update the entity and it's components
function Entity:update()
	for _, component in ipairs(self.components) do
		component:update()
	end
end

return Entity
