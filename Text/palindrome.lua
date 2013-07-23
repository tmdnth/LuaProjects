--[[
Check if Palindrome - Checks if the string entered
by the user is a palindrome. That is that it reads
the same forwards as backwards like "racecar"
]]

print("Enter suspected palindrome:")
string = io.read()

-- Fuck reversing the string manually again
if(string == string.reverse(string)) then result = " " else result = " not " end

print("That's" .. result .. "a palindrome!")