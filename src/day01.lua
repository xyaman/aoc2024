FILENAME = "src/day01.txt"

function table.find_ocurrences(tbl, value)
	local count = 0
	for _, v in ipairs(tbl) do
		if v == value then
			count = count + 1
		end
	end

	return count
end

local part1 = function()
	local l, r = {}, {}

	for line in io.lines(FILENAME) do
		local n1, n2 = line:match("(%d+)%s+(%d+)")
		table.insert(l, tonumber(n1))
		table.insert(r, tonumber(n2))
	end

	table.sort(l)
	table.sort(r)

	local sum = 0
	for i = 1, #l, 1 do
		sum = sum + math.abs(l[i] - r[i])
	end

	print(sum)
end

local part2 = function()
	local l, r = {}, {}

	for line in io.lines(FILENAME) do
		local n1, n2 = line:match("(%d+)%s+(%d+)")
		table.insert(l, tonumber(n1))
		table.insert(r, tonumber(n2))
	end

	local similarity = 0
	for i = 1, #l, 1 do
		similarity = similarity + l[i] * table.find_ocurrences(r, l[i])
	end

	print(similarity)
end

part1()
part2()
