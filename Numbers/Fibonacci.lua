--[[
Fibonacci Sequence – Enter a number and have
the program generate the Fibonacci sequence
to that number or to the Nth number.
]]


--[[
fiblist = setmetatable({ [0] = 0, [1] = 1 }, { __tostring = function(t)
	ret = ""
	for i, v in ipairs(t) do ret = ret .. v
		if i ~= #t then ret = ret .. ", " end
	end
	return ret
end })
]]

-- A much more elegant solution, from Wikipedia (of all things)
fiblist = setmetatable({ 1, 1 }, { __tostring = function(t)
		ret = ""
		for i, v in ipairs(t) do ret = ret .. v
			if i ~= #t then ret = ret .. ", " end
		end
		return ret
	end,
	-- !!!
	__index = function(fibs, n)
    	fibs[n] = fibs[n - 1] + fibs[n - 2]
    	return fibs[n]
  	end})

print("How long do you want the Fibonacci sequence? (max 999)")
k = io.read("*number")
if k > 999 then k = 999 end

--[[
for i = 2, k do fiblist[i] = fiblist[i - 2] + fiblist[i - 1] end

print("Here's your sequence:\n")
print(fiblist)
]]

print("\nYour requested Fibonacci number is " .. fiblist[k] .. ",\nand here's the entire Fibonacci sequence up to that number:\n")
print(fiblist)
