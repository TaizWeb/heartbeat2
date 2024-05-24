NewPhysics = {
	gravity = 0.5,
}
NewPhysics.__index = NewPhysics

--- Physics class constructor
-- @return table: The physics table
function NewPhysics:new()
	print("NEW UPDATE")
	local instance = setmetatable({}, NewPhysics)
	instance.parent = nil -- Unset until initialized
	-- instance.entities = {}
	return instance
end

function NewPhysics:update()
	print("CALLED UPDATE")
	self.parent.dy = self.parent.dy + self.gravity
	self.parent.y = self.parent.y + self.parent.dy
end

function NewPhysics:remove()
	print("COOL STORY CHAMP")
	return true
end
