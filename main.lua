local DEBUG_MODE = true
local LOOP_INTERVAL = 10 -- in seconds

local function debug(msg)
    if DEBUG_MODE then
    trigger.action.outText("[Red-AI-Reinforcements] ".. tostring(msg), 10)
    end
end

local function getRedAbs()
    local redAbs = coalition.getAirbases(2)

    for i, airbase in ipairs(redAbs) do
        local abName = Object.getName(airbase)
        debug(abName)
    end
end

local function manageLoop()
    getRedAbs()
    return timer.getTime() + LOOP_INTERVAL
end

timer.scheduleFunction(manageLoop, nil, timer.getTime() + LOOP_INTERVAL)
