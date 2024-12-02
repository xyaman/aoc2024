FILENAME = "src/day02.txt"

function table.level_from_line(line)
    local level = {}
    for n in line:gmatch("%d+") do
        table.insert(level, tonumber(n))
    end

    return level
end

local part1 = function()
    local safeentries = 0
    for line in io.lines(FILENAME) do
        --- @type number?
        local prev = 0
        local is_increasing = false
        local valid = true

        for i, n in ipairs(table.level_from_line(line)) do
            local diff = prev - n

            if i == 2 then
                is_increasing = prev < n
            elseif i > 2 and is_increasing ~= (prev < n) then
                valid = false; break
            end

            if i > 1 and (math.abs(diff) > 3 or (diff) == 0) then
                valid = false; break
            end

            prev = n
        end
        if valid then safeentries = safeentries + 1 end
    end

    print(safeentries)
end

local part2 = function()
    local safeentries = 0
    for line in io.lines(FILENAME) do
        local level = table.level_from_line(line)

        for i, _ in ipairs(level) do
            -- we reinsert the element later
            local temp = table.remove(level, i)

            --- @type number?
            local prev = 0
            local is_increasing = false
            local valid = true

            for j, n in ipairs(level) do
                local diff = prev - n

                if j == 2 then
                    is_increasing = prev < n
                elseif j > 2 and is_increasing ~= (prev < n) then
                    valid = false; break
                end

                if j > 1 and (math.abs(diff) > 3 or (diff) == 0) then
                    valid = false; break
                end

                prev = n
            end

            if valid then safeentries = safeentries + 1; break end

            table.insert(level, i, temp)
        end
    end

    print(safeentries)
end

part1()
part2()
