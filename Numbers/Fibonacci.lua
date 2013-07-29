--[[
Fibonacci Sequence – Enter a number and have
the program generate the Fibonacci sequence
to that number or to the Nth number.
]]

fiblist = setmetatable({ [0] = 0, [1] = 1 }, { __tostring = function(t)
	ret = ""
	for i, v in ipairs(t) do ret = ret .. v
		if i ~= #t then ret = ret .. ", " end
	end
	return ret
end })

print("How long do you want the Fibonacci sequence? (max 999)")
k = io.read("*number")
if k > 999 then k = 999 end

for i = 2, k do fiblist[i] = fiblist[i - 2] + fiblist[i - 1] end

print("Here's your sequence:\n")
print(fiblist)
