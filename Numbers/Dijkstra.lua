--[[
Dijkstra’s Algorithm – Create a program that finds
the shortest path through a graph using its edges.
]]

--------------------------
--- Simple Graph class ---
--------------------------
-- Nodes is a table with boolean values for each existing node
-- Edges are tables with start, stop, and weight

Graph = {}
Graph.__index = Graph

setmetatable(Graph, {__call = function(...)
		return setmetatable({ nodes = {}, edges = {} }, Graph)
	end})

-- Graph:push(x) => push node x
-- Graph:push({ x, y, w }) => push edge x --(w)--> y, along with nodes x, y
function Graph:push(x)
	if type(x) == "number" or type(x) == "string" then self.nodes[x] = true
	elseif type(x) == "table" then
		for i, v in ipairs(self.edges) do
			if v.start == x[1] and v.stop == x[2] then table.remove(self.edges, i) end
		end

		self.nodes[x[1]] = true
		self.nodes[x[2]] = true
		if not x[3] then x[3] = 1 end
		table.insert(self.edges, { start = x[1], stop = x[2], weight = x[3] })
	end
end

-- Graph:remove({ x, y}) => remove edge x --(w)--> y, return w or false
-- Graph:remove(x) => remove node x, along with all its edges, return x or false
function Graph:remove(x)
	if type(x) == "table" then
		for i, v in ipairs(self.edges) do
			if v.start == x[1] and v.stop == x[2] then
				ret = self.edges[i].weight
				table.remove(self.edges, i)
				return ret
			end
		end
		return false
	elseif type(x) == "number" or type(x) == "string" then
		if self.nodes[x] == nil then return false else
			for i, v in ipairs(self.edges) do
				if v.start == x or v.stop == x then table.remove(self.edges, i) end
			end
			self.nodes[x] = nil
			return x
		end
	end
end

function Graph:__tostring()
	ret = "Nodes:\n"
	for k, v in pairs(self.nodes) do
		if v then ret = ret .. k .. "\n" end
	end
	ret = ret .. "\nEdges:\n"
	for _, v in ipairs(self.edges) do
		ret = ret .. v.start .. "\t--(" .. v.weight .. ")-->\t" .. v.stop .."\n"
	end
	return ret
end

--------------------------
--- End of Graph class ---
--------------------------

-- TODO: Add Dijkstra algorithm!

x = Graph()
x:push{"a", 2, 5}
x:push{2, 3, 3}
x:push{3, 1, 1}
x:push{2, 3, 4}

print(x)

print(x:remove(2))
x:remove(3)

print(x)
