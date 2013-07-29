--[[
Family Tree Creator – Create a class called “Person”
which will have a name, when they were born and when
(and if) they died. Allow the user to create these
Person classes and put them into a family tree struc-
ture. Print out the tree to the screen.
]]

Person = {}
Person.__index = Person

setmetatable(Person, { __call = function(_, n)
	if type(n) == "string" then return setmetatable({ name = n, mother = false, father = false}, Person)
	else return nil end
end })

function Person:__tostring()
	return self.name
end

-- addParent(), addChild()

x = Person("Laura")

print(x)
