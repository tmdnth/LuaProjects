--[[
Matrix Class – A class to manage matrices.
Add, subtract and multiple matrices.
]]

Matrix = {}
Matrix.__index = Matrix

setmetatable(Matrix, { __call = function(_, ...) return Matrix.new(...) end })

function Matrix.new(...)
	if select("#", ...) == 1 and type(select(1, ...)) == "number" then
		ret = Matrix.new(select(1, ...), select(1, ...), 0)
		for i = 1, select(1, ...) do ret.mat[i][i] = 1 end
		return ret
	elseif select("#", ...) == 1 and type(select(1, ...)) == "table" then
		oldMat = select(1, ...)
		ret = Matrix(oldMat.width, oldMat.height, 0)
		for i = 1, oldMat.width do
			for j = 1, oldMat.height do
				ret.mat[i][j] = oldMat.mat[i][j]
			end
		end
		return ret
	elseif select("#", ...) == 3 then
		ret = setmetatable({ width = select(1, ...), height = select(2, ...), mat = {} }, Matrix)
		for i = 1, ret.width do
			col = {}
			for j = 1, ret.height do
				table.insert(col, select(3, ...))
			end
			table.insert(ret.mat, col)
		end
		return ret
	else
		return setmetatable({ width = 0 , height = 0}, Matrix)
	end
end

function Matrix:__tostring()
	ret = ""
	for i = 1, self.height do
		ret = ret .. "("
		for j = 1, self.width do
			ret = ret .. "\t" .. self.mat[j][i] .. "\t"
			if j ~= self.width then ret = ret .. "|" end
		end
		if i ~= self.height then ret = ret .. ")\n" else ret = ret .. ")" end
	end
	return ret
end

function Matrix.__add(a, b)
	if type(a) == "number" then
		ret = Matrix(b)
		for i = 1, b.width do
			for j = 1, b.height do
				ret.mat[i][j] = b.mat[i][j] + a
			end
		end
		return ret
	elseif type(b) == "number" then
		ret = Matrix(a)
		for i = 1, a.width do
			for j = 1, a.height do
				ret.mat[i][j] = a.mat[i][j] + b
			end
		end
		return ret
	elseif a.height == b.height and a.width == b.width then
		ret = Matrix(b)
		for i = 1, b.width do
			for j = 1, b.height do
				ret.mat[i][j] = b.mat[i][j] + a.mat[i][j]
			end
		end
		return ret
	else return nil	end
end

function Matrix.__mul(a, b)
	if type(a) == "number" then
		ret = Matrix(b)
		for i = 1, b.width do
			for j = 1, b.height do
				ret.mat[i][j] = b.mat[i][j] * a
			end
		end
		return ret
	elseif type(b) == "number" then
		ret = Matrix(a)
		for i = 1, a.width do
			for j = 1, a.height do
				ret.mat[i][j] = a.mat[i][j] * b
			end
		end
		return ret
	elseif a.width == b.height then
		ret = Matrix(b.width, a.height, 0)
		for i = 1, b.width do
			for j = 1, a.height do
				for k = 1, a.width do
					ret.mat[i][j] = ret.mat[i][j] + (a.mat[k][j] * b.mat[i][k])
				end
			end
		end
		return ret
	else return nil	end
end

function Matrix.__sub(a, b)
	if type(b) == "number" then
		return a + (b * -1)
	elseif a.height == b.height and a.width == b.width then
		return a + (b * -1)
	else return nil	end
end

--[[
print("Do stuff")

mat = Matrix(3)
mat = mat + 5
mat = mat * 3

mat2 = Matrix(mat)

mat = mat2 + mat2 + mat2 * mat2 + mat2 * mat2

print(mat)
print "\n"
print(mat2)
]]
