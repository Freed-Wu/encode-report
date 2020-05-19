#=
This code is used to realize Huffman encoding.
                                  .
     .              .   .'.     \   /
   \   /      .'. .' '.'   '  -=  o  =-
 -=  o  =-  .'   '              / | \
   / | \                          |
     |                            |
     |                            |
     |                      .=====|
     |=====.                |.---.|
     |.---.|                ||=o=||
     ||=o=||                ||   ||
     ||   ||                ||   ||
     ||   ||                ||___||
     ||___||                |[:::]|
     |[:::]|                '-----'
     '-----'
=#

# code
"get the characters existing in a string"
@. getchar(str::String) = unique(collect(str))
"get the number of a character existing in a string"
getnum(str::String, char::Char) = length(findall(collect(str) .== char))
"""
huffmankey(str)

key of huffman

# Examples

```jldoctest
julia> huffmankey("abca")
'a' => 0
'c' => 3
'b' => 2
```
"""
huffmankey(str::String) = begin
	chars = getchar(str)
	nums = getnum.(str, chars)
	dict = Dict()
	for i in range(1, length = length(nums))
		index = argmax(nums)
		val = 2^(i - 1) - 1
		push!(dict, chars[index] => i == length(nums) ? val : 2val)
		nums[index] = 0
	end
	dict
end
"code a string using a key"
code(str::String, dict::Dict) = begin
	nums = Vector{Int}()
	for char in str
		push!(nums, dict[char])
	end
	nums
end
"huffman code, result is an array"
huffmancode(str::String) = code(str, huffmankey(str))
"get the bit presentation of int"
bit(int::Int) = begin
	bitstr = bitstring(int)
	lenall = length(bitstr)
	len = int == 0 ? 0 : Int(floor(log2(int)))
	bitstr[lenall - len:lenall]
end
"""
huffman code, result is a string

# Examples

```jldoctest
julia> huffman("abca")
"010110"
```
"""
huffman(str::String) = join(bit.(huffmancode(str)))

# decode
"decode a string using a key"
decode(ints::Vector{Int}, dict::Dict) = begin
	chars = Vector{Char}()
	ks = collect(keys(dict))
	vs = collect(values(dict))
	for int in ints
		push!(chars, ks[findfirst(vs .== int)])	
	end
	join(chars)
end
"get the int of bit presentation"
debit(str::String) = parse(Int, str, base=2)
"""
dehuffman(str, dict)

huffman decode, input is a string

# Examples

```jldoctest
julia> dehuffman("010110", huffmankey("abca"))
"abca"
```
"""
dehuffman(str::String, dict::Dict) = begin
	ints = split(str, '0')
	pop!(ints)
	bitstrs = ints.* string.(Int64.(zeros(length(ints))))
	decode(debit.(bitstrs), dict)
end

