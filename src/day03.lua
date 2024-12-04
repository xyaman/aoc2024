--- @return string
local read_input = function()
    local file = io.open("src/day03.txt", "r")
    --- @type string
    local text = file:read("*a")
    file:close()

    -- remove \n
    return text:gsub("\n", "")
end

local part1 = function()
    local input = read_input()
    local sum = 0

    -- get all numbers inside ()
    for v in input:gmatch("mul%(%d+,%d+%)") do
        local n1, n2 = v:match("(%d+),(%d+)")
        sum = sum + (tonumber(n1) * tonumber(n2))
    end

    print(sum)
end

local part2 = function()
    local input = read_input()
    local sum = 0

    -- in lua `?` is `-` (i guess)
    for match in input:gmatch("(.-)(do)") do
        local start = match:sub(1, 3)
        if (start ~= "n't") then
            for v in match:gmatch("mul%(%d+,%d+%)") do
                local n1, n2 = v:match("(%d+),(%d+)")
                sum = sum + (tonumber(n1) * tonumber(n2))
            end
        end
    end

    -- we are ignoring a case where there is a valid match after the last 'do'
    -- found


    print(sum)
end

part1()
part2()
