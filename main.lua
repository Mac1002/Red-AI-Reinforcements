--[[
Red-AI-Reinforcments V0.1 
an in development script written by Mac1002.
]]--

local DEBUG_MODE = true
local LOOP_INTERVAL = 10 -- in seconds

local function debug(msg)
    if DEBUG_MODE then
    trigger.action.outText("[Red-AI-Reinforcements] ".. tostring(msg), 10)
    end
end

local function getRedAbs()
    local redAirbases = coalition.getAirbases(1) -- Im an idiot that should read documentation when having issues with this line
    for i, airbase in ipairs(redAirbases) do
        local abName = Object.getName(airbase)
        debug(abName)
        debug("Total RED airbases: "..#redAirbases)
    end
end

local function manageLoop()
    getRedAbs()
    return timer.getTime() + LOOP_INTERVAL
end

timer.scheduleFunction(manageLoop, nil, timer.getTime() + LOOP_INTERVAL)
