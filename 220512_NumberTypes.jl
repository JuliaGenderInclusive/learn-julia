### A Pluto.jl notebook ###
# v0.19.4

using Markdown
using InteractiveUtils

# ╔═╡ cd0fbb5a-d1db-11ec-249d-47d3893286aa
md"""
# Learn Julia with Us 4: Number Types
"""

# ╔═╡ 23d59c73-d623-417e-bf60-e4f3d9b855a4
md"""
## Recap 

### String concatenation

*Concatenation* connects strings using the `*` operator.
"""

# ╔═╡ 33fd3763-18c5-448c-a706-ca3c2ed1f4e6
begin
	fav_food = ""
	fav_guest = ""
	"It's always nice to enjoy " * fav_food * " with " * fav_guest * "!"
end

# ╔═╡ d7b51546-c6c7-41d0-a6c6-a5d97e709088
md"""
### String escape sequences
Certain characters are not allowed within strings in Julia, including $ and additional ". 

To include these characters, they must be preceded by a backslash: `\` 

There are also special escape sequences with special functions: `\n` for a new line and `\t` for a tab indent.
"""

# ╔═╡ 28addb9e-a1dd-4f20-80fd-c9143aa2ae9d
Text("This is \na multi-line quote \nthat contains \"quotation marks\"")

# ╔═╡ fb9060db-8dac-4f0e-bd7b-3f461fb86f49
md"""
### String interpolation 

*Interpolation* allows you to include values that are not yet available or otherwise stored in a variable using the `$` operator.
"""

# ╔═╡ a0128cb4-557a-4420-874a-883c8cd4b6bf
begin
	fav_number = 12
	"I want to eat $(fav_number * 2) " * fav_food * "s"
end

# ╔═╡ a93d8ad2-d579-41dc-9431-083d4c52c23e
md"""
### Arrays 
*Arrays* contain multiple items that do not have to be the same type.

They are wrapped in square brackets. 
"""

# ╔═╡ 5b63ec0c-636f-471e-9581-e667f28c3e6b
grocery_list = ["tofu", "asparagus", "oat milk"]

# ╔═╡ 2790bfd8-b206-4316-bed1-8e621fe9721a
md"""
### Indexing
Take a certain (numbered) element of an array or other container (incl. strings) using an index position in square brackets. 

Indexing starts at 1.
"""

# ╔═╡ 3fc38c36-7366-4e46-8cf0-639a140602bf
grocery_list[1]

# ╔═╡ ad0bd429-eb34-4e52-b750-4787a301ff7f
begin
	greeting = "Hey folks, I hope you're enjoying Julia!"
	greeting[35]
end

# ╔═╡ adf5b39a-bab2-4c85-ab31-ac1b09fee460
md"""
### Array comprehension 
A comprehension is a kind of loop that iterates over a container, and can do an operation to each element in that container. 

Syntax: new_array = [operation(item) for item in container]

The types of operation you can do to each item is determined by the type of the item (not the container.)
"""

# ╔═╡ 79429d49-82ce-4f11-ba54-6990401c7d47
begin
	excited_groceries = [uppercase(thing) for thing in grocery_list]
end

# ╔═╡ 27182464-d3cc-4b17-bc7b-fe7bf688a686
md"""
# Number Types 

From Julia for Nervous Beginners - Week 2: Number Types 

https://www.youtube.com/watch?v=GHWfIz5s7uY&feature=emb_title

Why number types? 

(1) To better understand the many error messages that mention number types

(2) As an introduction to the Julia type system

**In Julia, you don't usually have to specify which type your input should be -- Julia selects the best option**

However, when you start writing functions, you need to tell Julia can generally guess (or you show it by using " delimiters for strings, or ' for characters)
"""

# ╔═╡ 3504abdb-17de-4ac9-a637-73ff02f50a4a
md"""
# What has a Type anyway?

**Values** have types. Not variables! Variables are just containers.
"""

# ╔═╡ f090729b-a697-4def-a20b-c3eaff6fad1d
this_variable = 3

# ╔═╡ cfe475c6-ac85-4cc3-953d-bcb6b12681b0
md"""
## How does Julia store a number?

Under the hood, all numbers are stored as 0s and 1s -> depending on the type, there may be more of less of these *bits* 

All numbers, integers or fractions, are subsumed under the **Abstract Type** of **Number** 

However, there are also **concrete types** like Floats and Integers

## Int64
Whole numbers (integers) stored as 64 bits

Cannot include decimal point
"""

# ╔═╡ 2e90ecf5-345a-4c9a-a47f-040a4745284a
bitstring(Int64(1))

# ╔═╡ 48631083-12c5-468b-aae3-a582494665b7
md"""
## Float64
Floats are another numeric type that can include integers as well as fractions.

They're also stored on 64 bits, but it looks a little different

Whole numbers can either be Int64 (integers) or Float64 (Floats) -- but the behind-the-scenes storage looks very different!
"""

# ╔═╡ 7574c617-1a1f-4941-8ca0-48eeba34ef3e
bitstring(Float64(1))

# ╔═╡ 2c31613d-bd6e-4deb-9b74-17bd9ceb0dcc
md"""
**Arithmetic between and Integer and a Float will result in a Float:**
"""

# ╔═╡ fdbcd63a-d05a-4ecf-ba5a-e8b318578eb2
begin 
	result = 5 - 2.5 
	typeof(result)
end

# ╔═╡ c3149487-95e8-4455-a1fc-d9c7512e17a9
md"""
### Special circumstances

**NaN** "Not a number", i.e. undefined or unrepresentable result

**Inf** "Infinity"
"""


# ╔═╡ 497021f3-8147-4a15-94fe-5fe4fef7e20f
0/0

# ╔═╡ 095166c5-283f-4163-a760-15ab50a824a1
md"""
**Very big numbers** represented in scientific notation, the numbers after the e are the exponent, so that the following number is really 

2.07 * 10^293
"""

# ╔═╡ db90d85a-2040-41f7-ab89-d3a6a0416a9d
(9.5^300)

# ╔═╡ c71b669b-0b11-4c9e-b63d-769e72ab425e
md"""
## Other number types
- Julia has less frequently used number types like Int8 and Float32 that use less bits -> this is more efficient but less accurate
- There are also other number types like complex and exact rational numbers
"""

# ╔═╡ 2bf94356-5682-4a27-bdf3-d0be408e0318
md"""
# Arithmetic 
### And some review of array comprehensions
"""

# ╔═╡ 74d86842-166b-4264-8e4e-57f2bb6d7fd9
md"""
In Julia, you can do all the math you could ever want :D Plus some...
"""

# ╔═╡ 0e9db7fe-6e45-41f4-bed5-81fad67d8202
3 + 4 * 2

# ╔═╡ 873d9b62-eb7c-44f9-b02a-2c1fa8b68cac
(3 + 4) * 2

# ╔═╡ 26415c75-4935-486d-923a-9932ec0b9363
4^3

# ╔═╡ 40ed63f5-47a8-48a1-8186-2ce4bc7750aa
md"""
You can also use mathematical notation easily:
"""

# ╔═╡ 02a98254-cc80-4f5a-a668-af8757dc04cf
begin 
	σ = 3
	2.5σ
end

# ╔═╡ 2f3eab21-7c84-479f-b81c-ebac92ff3a0d
md"""
Arrays of Numbers can also be used for array comprehensions
"""

# ╔═╡ 9cd11d64-887a-4225-9542-801249781ec8
ages = [28, 30, 24, 33, 37, 29]

# ╔═╡ bc5836e1-a430-431a-85f1-198459a92880
begin
	using Statistics
	mean(ages)
end

# ╔═╡ ed3a1c0d-1724-4596-9d21-d95d4db65310
ages_next_year = [age + 1 for age in ages]

# ╔═╡ 59ac9655-fedf-4a07-a320-1473f968eafd
doubled_age = [age * 2 for age in ages]

# ╔═╡ 436c3cc6-a73c-4734-8efa-1e0ec2cde9b2
md"""
**There are also operations you can do on arrays of Numbers**
"""

# ╔═╡ 0e589432-aadd-458e-871b-dcae590434e5
sum(ages)

# ╔═╡ 2cfc3565-08d7-4294-9edb-7da37ddd86a6
md"""
# Recap
- All values in Julia have a Type 
- Abstract types include sub-types called concrete types
- Numbers are an abstract type
- Concrete types include: Int64 and Float64

Next time: 
- User-defined functions and types in action!
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ Cell order:
# ╟─cd0fbb5a-d1db-11ec-249d-47d3893286aa
# ╟─23d59c73-d623-417e-bf60-e4f3d9b855a4
# ╠═33fd3763-18c5-448c-a706-ca3c2ed1f4e6
# ╟─d7b51546-c6c7-41d0-a6c6-a5d97e709088
# ╠═28addb9e-a1dd-4f20-80fd-c9143aa2ae9d
# ╟─fb9060db-8dac-4f0e-bd7b-3f461fb86f49
# ╠═a0128cb4-557a-4420-874a-883c8cd4b6bf
# ╟─a93d8ad2-d579-41dc-9431-083d4c52c23e
# ╠═5b63ec0c-636f-471e-9581-e667f28c3e6b
# ╟─2790bfd8-b206-4316-bed1-8e621fe9721a
# ╠═3fc38c36-7366-4e46-8cf0-639a140602bf
# ╠═ad0bd429-eb34-4e52-b750-4787a301ff7f
# ╟─adf5b39a-bab2-4c85-ab31-ac1b09fee460
# ╠═79429d49-82ce-4f11-ba54-6990401c7d47
# ╟─27182464-d3cc-4b17-bc7b-fe7bf688a686
# ╟─3504abdb-17de-4ac9-a637-73ff02f50a4a
# ╠═f090729b-a697-4def-a20b-c3eaff6fad1d
# ╟─cfe475c6-ac85-4cc3-953d-bcb6b12681b0
# ╠═2e90ecf5-345a-4c9a-a47f-040a4745284a
# ╟─48631083-12c5-468b-aae3-a582494665b7
# ╠═7574c617-1a1f-4941-8ca0-48eeba34ef3e
# ╟─2c31613d-bd6e-4deb-9b74-17bd9ceb0dcc
# ╠═fdbcd63a-d05a-4ecf-ba5a-e8b318578eb2
# ╟─c3149487-95e8-4455-a1fc-d9c7512e17a9
# ╠═497021f3-8147-4a15-94fe-5fe4fef7e20f
# ╟─095166c5-283f-4163-a760-15ab50a824a1
# ╠═db90d85a-2040-41f7-ab89-d3a6a0416a9d
# ╟─c71b669b-0b11-4c9e-b63d-769e72ab425e
# ╟─2bf94356-5682-4a27-bdf3-d0be408e0318
# ╟─74d86842-166b-4264-8e4e-57f2bb6d7fd9
# ╠═0e9db7fe-6e45-41f4-bed5-81fad67d8202
# ╠═873d9b62-eb7c-44f9-b02a-2c1fa8b68cac
# ╠═26415c75-4935-486d-923a-9932ec0b9363
# ╟─40ed63f5-47a8-48a1-8186-2ce4bc7750aa
# ╠═02a98254-cc80-4f5a-a668-af8757dc04cf
# ╟─2f3eab21-7c84-479f-b81c-ebac92ff3a0d
# ╠═9cd11d64-887a-4225-9542-801249781ec8
# ╠═ed3a1c0d-1724-4596-9d21-d95d4db65310
# ╠═59ac9655-fedf-4a07-a320-1473f968eafd
# ╟─436c3cc6-a73c-4734-8efa-1e0ec2cde9b2
# ╠═0e589432-aadd-458e-871b-dcae590434e5
# ╠═bc5836e1-a430-431a-85f1-198459a92880
# ╟─2cfc3565-08d7-4294-9edb-7da37ddd86a6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
