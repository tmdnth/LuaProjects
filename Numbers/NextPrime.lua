--[[
Next Prime Number – Have the program find prime numbers
until the user chooses to stop asking for the next one.
]]

primes = {}
current = 1

repeat

  repeat
    current = current + 1
    mod = -1
    for i, v in ipairs(primes) do
      mod = current % v
      if mod == 0 then break end
    end

    if mod ~= 0 then
      table.insert(primes, current)
      print("Next prime is " .. current)
    end
  until mod ~= 0

  print("Output another prime?")
until io.read() ~= "y"