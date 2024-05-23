require("lib/input") -- This should probably be Heartbeat
require("lib/entity") -- This should probably be Heartbeat
require("lib/physics") -- This should probably be Heartbeat

local KEYS = {
	jump = "z",
	interact = "x",
}

physics = Physics:new()
entity = Entity:new("boxman", 50, 50)
physics:addEntity(entity)

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
	physics:update()
	print(entity.dy)
end
