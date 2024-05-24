require("lib/input") -- This should probably be Heartbeat
require("lib/entity") -- This should probably be Heartbeat
require("lib/physics") -- This should probably be Heartbeat
require("lib/new_physics") -- This should probably be Heartbeat

local KEYS = {
	jump = "z",
	interact = "x",
}

-- physics = Physics:new()
physics = NewPhysics:new()
entity = Entity:new("boxman", 50, 50)
entity:addComponent(physics)
-- physics:addEntity(entity:)

function love.load()
	love.window.setTitle("Electric Boogaloo")
	local testEntity = Entity:new()
	print(testEntity.name)
end

function love.keypressed(key, scancode, isrepeat)
	if key == KEYS.jump then
		print("JUMPED")
	end
end

function love.draw()
	entity:draw()
	entity:update()
	-- physics:update()
	-- print(entity.dy)
end
