local NewPhysics = {
	gravity = 0.5, -- Arbitrary gravitation constant
}
NewPhysics.__index = NewPhysics

--- Physics class constructor
-- @return table: The physics table
function NewPhysics:new()
	local instance = setmetatable({}, NewPhysics)
	instance.parent = nil -- Unset until initialized
	return instance
end

--- Update the object's change in speed to match gravity
function NewPhysics:update()
	if self.parent then
		self.parent.dy = self.parent.dy + self.gravity
		self.parent.y = self.parent.y + self.parent.dy
	end
end

--- Remove the physics system
function NewPhysics:remove()
	if self.parent then -- Maybe this can be an inherited feature?
		print("Removing physics :(")
		self.parent = nil
		return true
	end
end

return NewPhysics
