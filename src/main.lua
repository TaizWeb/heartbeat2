local Entity = require("lib/entity") -- This should probably be Heartbeat
local Physics = require("lib/physics") -- This should probably be Heartbeat
local Level = require("lib/level")

local KEYS = {
	jump = "z",
	interact = "x",
}

-- physics = Physics:new()
physics = Physics:new()
level = Level:new()
entity = Entity:new("boxman", 50, 50)
-- physics = Level:new()
entity:addComponent(physics)
-- physics:addEntity(entity:)
level:loadLevel("level_mockup.json")

function love.load()
	love.window.setTitle("Electric Boogaloo")
	local testEntity = Entity:new()
	print(testEntity.name)
end

function love.keypressed(key, scancode, isrepeat)
	if key == KEYS.jump then
		print("JUMPED")
		entity:remove()
		entity = nil
	end
end

function love.draw()
	if entity ~= nil then
		entity:draw()
		entity:update()
	end
	-- physics:update()
	-- print(entity.dy)
end
