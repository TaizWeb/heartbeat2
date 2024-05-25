local Physics = {
	gravity = 0.5, -- Arbitrary gravitation constant
}
Physics.__index = Physics

--- Physics class constructor
-- @return table: The physics table
function Physics:new()
	local instance = setmetatable({}, Physics)
	instance.parent = nil -- Unset until initialized
	return instance
end

--- Update the object's change in speed to match gravity
function Physics:update()
	if self.parent then
		self.parent.dy = self.parent.dy + self.gravity
		self.parent.y = self.parent.y + self.parent.dy
	end
end

--- Remove the physics system
function Physics:remove()
	if self.parent then -- Maybe this can be an inherited feature?
		print("Removing physics :(")
		self.parent = nil
		return true
	end
end

return Physics
