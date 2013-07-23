--[[
Next Prime Number – Have the program find prime numbers
until the user chooses to stop asking for the next one.
]]

primes = {}
current = 1

while(true) do
	print("Output another prime?")
	if io.read() == "y" then
		noNewPrime = true

		while noNewPrime do
			current = current + 1
			notPrime = false

			-- Yes, we're inefficient.
			if #primes ~= 0 then
				for index, value in ipairs(primes) do
					if current % value == 0 then
						notPrime = true
						break
					end
				end
			end

			if not notPrime then
				print("\nHere it is!\n" .. current .. "\n")
				table.insert(primes, current)
				noNewPrime = false
			end
		end
	else
		break
	end
end