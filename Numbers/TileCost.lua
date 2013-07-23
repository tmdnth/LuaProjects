--[[
Find Cost of Tile to Cover W x H Floor - Calculate the
total cost of tile it would take to cover a floor plan
of width and height, using a cost entered by the user.
]]

print("What's the width?")
width = io.read()

print("What's the height?")
height = io.read()

print("Finally, what's the cost per tile?")
cost = io.read()

print("\nTo cover a " .. width .. " x " .. height .. " floor in those\ntiles," .. " you'd have to pay " .. (width * height * cost) .. ".")