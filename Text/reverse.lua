--[[
Reverse a String – Enter a string and the program
will reverse it and print it out.
]]

print("Enter string to reverse:")
string = io.read()

-- Too easy
-- print("Backwards, that reads:\n" .. string.reverse(string))
rev = ""
for i = 1, string.len(string) do
    rev = rev .. string.sub(string, -i, -i)
end

print("Backwards, that reads:\n" .. rev)