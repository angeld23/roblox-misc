local Base64 = {}

Base64.CharSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

function Base64.BitsToNum (bits) -- Convert a string of 1s and 0s to a number.
	assert(typeof(bits) == "string", "Arg1: Expected string, got "..typeof(bits))
	
	local result = 0
	local factor = 1
	for i = 1, #bits do
		local bit = string.sub(bits, -i, -i)
		if bit == "1" then
			result += factor
		end
		factor *= 2
	end
	return result
end

function Base64.NumToBits (num, width) -- Convert a number to a string of 1s and 0s.
	assert(typeof(num) == "number", "Arg1: Expected number, got "..typeof(num))
	assert(typeof(width) == "number" or typeof(width) == "nil", "Arg2: Expected number, got "..typeof(width))
	
	if not width then
		width = math.floor(math.log(num, 2) + 1)
	end
	
	local result = ""
	for i = width, 1, -1 do
		result = result .. tostring(bit32.extract(num, i - 1, 1))
	end
	return result
end

function Base64.CharToNum (char) -- Convert a 1-length Base64 character string to a number value (0-63)
	assert(typeof(char) == "string", "Arg1: Expected string, got "..typeof(char))
	assert(#char == 1, "Arg1: String must be of length 1, got string of length "..#char)
	
	for i = 1, 64 do
		if string.sub(Base64.CharSet, i, i) == char then
			return i - 1
		end
	end
	return nil
end

function Base64.NumToChar (num) -- Convert a number (0-63) into a Base64 character
	num = math.floor(num)
	assert(typeof(num) == "number", "Arg1: Expected number, got "..typeof(num))
	assert(num >= 0 and num <= 63, "Arg1: Expected number between 0 and 63 (inclusive), got "..tostring(num))
	
	return string.sub(Base64.CharSet, num + 1, num + 1)
end

function Base64.EncodeBytes (data, padding) -- Encode table of numbers into Base64
	assert(typeof(data) == "table", "Arg1: Expected table, got "..typeof(data))
	assert(typeof(padding) == "boolean" or typeof(padding) == "nil", "Arg2: Expected boolean, got "..typeof(padding))
	
	local result = ""
	local bits = ""
	
	for i = 1, #data do
		bits = bits .. Base64.NumToBits(data[i], 8)
	end
	bits = bits .. string.rep("0", 6 - #bits % 6)
	
	for i = 1, #bits, 6 do
		result = result .. Base64.NumToChar(Base64.BitsToNum(string.sub(bits, i, i + 5)))
	end
	
	if padding then
		result = result .. string.rep("=", 4 - #result % 4)
	end
	
	return result
end

function Base64.EncodeString (data, padding) -- Encode string data into Base64
	assert(typeof(data) == "string", "Arg1: Expected string, got "..typeof(data))
	assert(typeof(padding) == "boolean" or typeof(padding) == "nil", "Arg2: Expected boolean, got "..typeof(padding))
	
	local bytes = {}
	for i = 1, #data do
		bytes[i] = string.byte(string.sub(data, i, i))
	end
	return Base64.EncodeBytes(bytes, padding)
end

function Base64.Decode (data) -- Decode Base64 data into a table of bytes (0-255)
	assert(typeof(data) == "string", "Arg1: Expected string, got "..typeof(data))
	
	local bits = ""
	local result = {}
	
	for i = 1, #data do
		local num = Base64.CharToNum(string.sub(data, i, i))
		if num then
			bits = bits .. Base64.NumToBits(num, 6)
		end
	end
	
	for i = 1, math.floor(#bits / 8) do
		result[i] = Base64.BitsToNum(string.sub(bits, i * 8 - 8 + 1, i * 8))
	end
	
	return result
end

function Base64.BytesToString (bytes) -- Decode table of bytes to a string
	assert(typeof(bytes) == "table", "Arg1: Expected table, got "..typeof(bytes))
	
	return string.char(table.unpack(bytes))
end

function Base64.DecodeToString (data) -- Decode Base64 into text
	return Base64.BytesToString(Base64.Decode(data))
end

return Base64
