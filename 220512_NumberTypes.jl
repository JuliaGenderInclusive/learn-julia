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
"""

# ╔═╡ cfe475c6-ac85-4cc3-953d-bcb6b12681b0


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
# ╠═cfe475c6-ac85-4cc3-953d-bcb6b12681b0
