--[[
Red-AI-Reinforcments V0.1 
an in development script written by Mac1002.
]]--

local DEBUG_MODE = true
local DEBUG_INTERVAL = 9 -- in seconds
local LOOP_INTERVAL = 10

local coalitionNames = {
    [0] = "NEUTRAL",
    [1] = "RED",
    [2] = "BLUE"
}

local function debug(msg)
    if DEBUG_MODE then
    trigger.action.outText("[Red-AI-Reinforcements] ".. tostring(msg), DEBUG_INTERVAL)
    end
end

local e = {}
function e:onEvent(event)
    if event.id == world.event.S_EVENT_BASE_CAPTURED then
    local ab = event.place
    local abName = ab:getName()
    local side = ab:getCoalition()
    local owner = coalitionNames[side] or "Unknown"
    debug(abName.." Captured by "..owner)
    end
end
world.addEventHandler(e)

local function getAbs()
    local neutralAirbases = coalition.getAirbases(0)
    local redAirbases = coalition.getAirbases(1) -- Im an idiot that should read documentation when having issues with this line
    local blueAirbases = coalition.getAirbases(2)
    local WorldAirbases = world.getAirbases()
    
    for i, airbase in ipairs(WorldAirbases) do
        local abName = Object.getName(airbase)
        local airbaseSide = airbase:getCoalition()
        local owner = coalitionNames[airbaseSide]
        debug("Airbase: "..abName.." | Owner: "..owner)
    end
    debug("\n".."Total Neutral Airbases: "..#neutralAirbases.."\n".."Total RED airbases: "..#redAirbases.. "\n" .."Total BLU Airbases: "..#blueAirbases)
end

local function manageLoop()
    getAbs()
    return timer.getTime() + LOOP_INTERVAL
end

timer.scheduleFunction(manageLoop, nil, timer.getTime() + LOOP_INTERVAL)