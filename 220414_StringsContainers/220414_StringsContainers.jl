### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ 2f4ff1f0-b1b8-11ec-117e-031311e58061
md"# Learn Julia with us 3

###### Resources
- *Julia for nervous beginners* on JuliaAcademy - Videos on string literals, escape sequences and interpolation & data containers
- Logan Kilpatrick's *Julia projects for beginners*: <https://github.com/logankilpatrick/Julia-Projects-for-Beginners/blob/main/madlibs.jl>
"

# ╔═╡ 46b7ea47-b5f6-40f0-b4e2-e12ad9c857ec
md"## More on strings

### Quick recap
...on **string concatenation**: use * to concatenate several strings:
"

# ╔═╡ a926b5bf-88f7-4b4e-9cf6-71a7010c6ec4
begin
	name1 = "Kyla"
	name2 = "Julia"
	connector = " and "
	name1 * connector * name2 * " are your teachers today"
end

# ╔═╡ 19775d8f-1ef1-44ec-a1c6-3e8cbe15d5be
md"
We've used a begin and end block to write several lines of code in one code cell (usually, Pluto only allows one line of code per cell).

Note that + won't work for strings and will throw the following error:"

# ╔═╡ cb73dd96-b46c-467e-ad9f-aba48899ac23
name1 + connector + name2 + " are your teachers today"

# ╔═╡ a7f9f3a6-7506-4deb-a24d-ecbdf541dacf
md"Reminder that **variable assignment** follows these rules:
- variable name on the left, content on the right
- equal signs to connect the two
- variable names can't start with a number or other special character
"

# ╔═╡ 54d251c5-2216-49d5-aac8-5df6d1fdcc26
md"### String escape sequences

Let's try to create a variable with the variable name being a dollar bill emoji (type \: and press tab to see the options for emojis) and assign it the value $.
"

# ╔═╡ 800d5ffe-0fef-433f-9166-a3028d1d2059
💵 = "$"

# ╔═╡ b2ee8dbe-b540-42ca-8fc6-0ab503f841c3
md"
Julia complains about an 'invalid interpolation syntax'. The reason for this error is that the dollar sign actually has a special meaning (which we'll get to in a minute). If we want to use $, we need to 'escape' it by adding a backslash.
"

# ╔═╡ b7554a0f-118a-4015-b359-9660d1f033cb
💵 = "\$"

# ╔═╡ bf6b4de4-9d46-4c6f-b146-020e8b89f8ae
"That'll be 6\$ please"

# ╔═╡ 501d6e72-4382-46cc-b55c-d78b84e191de
md"We've already used the double quotation marks \" \" a lot. The are delimiters, signaling to Julia where a string starts and ends. But what if we have quotation marks within a string? We can escape them with \\. Here's an example:"

# ╔═╡ df8d33c5-6299-467b-82b0-23d1c77d017b
barista = "The barista said: \"That'll be 6\$, please!\" and I pulled out my wallet"

# ╔═╡ 214c1ef6-9422-4078-b0f5-9234a9a01a81
md"Printing this variable will not show the backslashes.

Note that in a script (e.g., if you're working in an IDE such as VS Code), you could  simply use print() or println(). In Pluto, you need to use Text() instead:"

# ╔═╡ 480c287b-ab26-4675-86fe-23dd5d339728
Text(barista)

# ╔═╡ a7a4dd37-9918-4aa4-85c9-f2111e8bc5c1
md"The backslash itself also needs to be escaped if we want to use it literally:"

# ╔═╡ 36836c0b-52c5-462e-b16b-ccfd91ef6cd8
Text("\\")

# ╔═╡ 97c8a3ef-4e5d-4345-bcd7-c3a8b9af8ddc
md"There are other useful escape sequences:
- \\n for new line
- \\t for tab."

# ╔═╡ 2db8c172-ee37-4d92-a4c7-f4adf4bcf3fb
Text("This text on the first line.\nThis on the second line.\nAnd this is what\ttab-delimited\t text looks like.")

# ╔═╡ be0f4422-2ee8-4e52-9b89-9c25314c3598
md"### String interpolation

With string interpolation, you can insert values into a text that change or are not available at the time of writing. For this, we need the dollar sign we encountered earlier.
"

# ╔═╡ b3d876f8-c2d5-47da-95c5-59302a88a5f2
begin
	age = 11
	name = "Flocke"
	weight = "4.5"
end

# ╔═╡ f14672c7-f3a9-4463-b72e-232c01c42b16
"My cat is $(age) years old. Her name is $(name) and she weighs $(weight) kg."

# ╔═╡ 212737ec-5627-4c71-a3ed-24b665b5e4a4
md"If you have an unambiguous variable name and don't need to change its value, the round brackets are optional:"

# ╔═╡ b0a0c386-ecf4-4a37-b89e-da1696c3854f
"My cat is $age years old"

# ╔═╡ 3d2d32c0-f1ef-43e5-8157-61cd0843dd5a
md"...but if that's not the case, you need them:"

# ╔═╡ 1ff5097b-a475-4641-a90b-b117a92f38f4
"Next year, my cat will be $age + 1 years old"

# ╔═╡ 139d3c54-5bb5-46c5-8f2b-8e9a7c790b38
"Next year, my cat will be $(age + 1) years old"

# ╔═╡ f1a6c1e0-ee13-4ad6-aab0-30a36c1a083c
md"String concatenation is also possible:"

# ╔═╡ 2eeef716-95ae-41cc-b69d-f1e8e4545f7b
begin
	favourite_animal = "cat"
	"I wish I had several $(favourite_animal*"s")"
end

# ╔═╡ cd23a0b1-4332-4c47-b710-bb89ca60795a
md"...and you can interpolate several variables:"

# ╔═╡ f308cbb1-f5df-4220-b1d6-089a237c5fa3
begin
	plural = "s"
	"I wish I had several $(favourite_animal*plural)"
end

# ╔═╡ 98363464-5be1-4861-8ac7-44820aebb6f0
md"## Data containers
A container is something that can contain more than one value (e.g., a string is a container - it can contain several characters).
### Indexing
Indexing = getting data out of a container - here, a string. For example:
"

# ╔═╡ 199b1f53-e8ef-47a4-8b02-b6442bde97b9
begin
	our_string = "abcdefghij"
	our_string[1]
end

# ╔═╡ 3623e025-9879-4888-ab21-269a5cff130e
md"Contrary to some other languages (e.g., Python), Julia starts at 1, not 0.

What happens if we try to call an element that goes beyond the container?
"

# ╔═╡ 2780a3b2-3a10-47b5-b0dd-3af5ba923a6b
our_string[11]

# ╔═╡ 5ece1eb8-3ea6-4981-ae40-44cfa32fe3a6
md"We can extract a range of characters using a colon:"

# ╔═╡ 43cacce0-e55c-4315-ad2a-35c863b0af1f
our_string[2:4]

# ╔═╡ d677f0a1-615d-4401-917a-8e3a7746435c
md"It's also possible to save a subset into a variable, and a space counts as a character:"

# ╔═╡ 3e1afcff-e61a-40c0-8e49-a173e628ea60
another_string = "Hi world"[1:4]

# ╔═╡ 82bae19d-251b-40b6-b8a9-1a0e936297ef
md"The start and end points of the range can also be variables:"

# ╔═╡ 464addb2-9e33-48a8-955b-dc71f8d8222e
begin
	ind_start, ind_end = 3, 6
	our_string[ind_start:ind_end]
end

# ╔═╡ 7ce9b5c6-4262-4dd1-996c-3de58d73562d
md"It's also possible to skip characters. For example, here's how to extract every second character:"

# ╔═╡ 71cb55a8-5724-4719-a31f-1e3e0bb0dfaa
our_string[1:2:9]

# ╔═╡ 5caacb1e-ea96-421a-b1c1-9e30014646c3
md"...or to count backwards, extracting every second character:"

# ╔═╡ a866f4d9-3ccc-48db-8922-d8d38e99a7dd
our_string[9:-2:1]

# ╔═╡ 9a332088-081f-4eeb-a465-54b79e395f19
md"Other useful elements are begin and end, to indicate that Julia should start at the first and last elements, respectively:"

# ╔═╡ f9229080-3690-4f65-8ddd-5350d3682a8d
our_string[end:-1:1]

# ╔═╡ f6a05912-4976-4fd4-96f8-ae3c903d6ee1
our_string[begin:3:end]

# ╔═╡ 581c5d83-119e-4fe2-bceb-4736d37c7615
md"If you only want to extract one character as a string, define a range:"

# ╔═╡ 975453ff-b76e-449a-ae2d-87b1d1b8715d
our_string[3:3]

# ╔═╡ 0b96494f-f991-43e1-927e-49c00d7e2569
md"Compare:"

# ╔═╡ 3270a20d-cf30-4cd2-b78b-cd2a6048dd89
our_string[3]

# ╔═╡ e332fce6-910a-49f9-8520-bd53a9a857d5
md"### Arrays & comprehension
Arrays are data containers that can be accessed through indexing. They're different from strings because
- their values can be changed
- they can hold different types (strings only hold characters)

To define an array, we need
- square brackets
- the keyword `for`
- the operator `in`
"

# ╔═╡ 11645886-447d-4a8b-b71d-674359d447f8
alphabet = [char for char in our_string]

# ╔═╡ 249d4b4b-ad55-41b6-9421-60abcb8a36a9
md"To translate the code above:
- create an array (square brackets)
- name it alphabet
- go through each element (`char for char`)
- `in` a previously defined string
- to fill the array

This kind of code is a **comprehension**. It iterates over a container.

Note that `char` is not a keyword and only temporary - we can change this to anything we like, as long as we use the same word twice:
"

# ╔═╡ 42108fda-7897-4959-b0ff-4a05e75bad5c
alphabet2 = [ch for ch in our_string]

# ╔═╡ 6787f390-9482-4e43-b1fa-b6bcd2b18fc2
alphabet3 = [letter for letter in our_string]

# ╔═╡ 81f5a2e7-33ae-402e-9a82-474f9963c832
md"We've created an array that contains characters."

# ╔═╡ 5882af46-0cd0-4036-824f-8456467e84d5
typeof(alphabet)

# ╔═╡ 1a8a7daf-d6df-49a3-80fe-6c7e9ca3b3bf
md"But we can also make one that contains strings - specifically, let's double each character in the original string:"

# ╔═╡ 0eef533d-1b8e-4703-859a-b97acddb5010
alphabet_rep = [char^2 for char in our_string]

# ╔═╡ 21a26a75-0369-4991-93e9-83737e7b9bf4
typeof(alphabet_rep)

# ╔═╡ 94ff7747-2df9-4168-8465-97ae1208c613
md"
To summarise, here's the structure of a comprehension:
[tempVar for tempVar in container]. If we want to change the values, we need to do that the first time we use tempVar.

Arrays are very efficient at storing memory. They are one-dimensional: only one number is necessary to index a value. Indexing for arrays works in the same way as it does for strings:
"

# ╔═╡ d758ee6c-e6c3-4227-b917-794e51040a92
alphabet_rep[2]

# ╔═╡ dbda5337-5800-43fb-9b13-6fdbe4ea2c0c
alphabet_rep[2:4]

# ╔═╡ 39a850eb-bc9c-4898-b0f9-693e2606fe30
alphabet_rep[1:2:6]

# ╔═╡ f7434fe4-c33d-49e4-a43a-e067a8cff123
md"
## Exercise: Mad libs generator
Mad libs is a word game in which people insert words into a text with blanks - for example:

\"Last night, I dreamed I was a _______(adjective) bird and flew to ______(place) with ________(noun).\"

Use Julia to write a mad libs generator that prompts users to **enter words** (e.g., to type in an adjective, place, and noun for our example above), then **inserts** these words into a sentence you've written and **prints** the complete sentence.

To record user input, you'll need one additional function - `readline` - which we'll demonstrate in the Julia REPL. It records what a user is typing, lets you save that input to a variable, and re-use it.

We'd recommend writing the full script using VS Code or another code editor and then run it in the Julia REPL using: `include()` with the path to your script in brackets.
"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─2f4ff1f0-b1b8-11ec-117e-031311e58061
# ╟─46b7ea47-b5f6-40f0-b4e2-e12ad9c857ec
# ╠═a926b5bf-88f7-4b4e-9cf6-71a7010c6ec4
# ╟─19775d8f-1ef1-44ec-a1c6-3e8cbe15d5be
# ╠═cb73dd96-b46c-467e-ad9f-aba48899ac23
# ╟─a7f9f3a6-7506-4deb-a24d-ecbdf541dacf
# ╟─54d251c5-2216-49d5-aac8-5df6d1fdcc26
# ╠═800d5ffe-0fef-433f-9166-a3028d1d2059
# ╟─b2ee8dbe-b540-42ca-8fc6-0ab503f841c3
# ╠═b7554a0f-118a-4015-b359-9660d1f033cb
# ╠═bf6b4de4-9d46-4c6f-b146-020e8b89f8ae
# ╟─501d6e72-4382-46cc-b55c-d78b84e191de
# ╠═df8d33c5-6299-467b-82b0-23d1c77d017b
# ╟─214c1ef6-9422-4078-b0f5-9234a9a01a81
# ╠═480c287b-ab26-4675-86fe-23dd5d339728
# ╟─a7a4dd37-9918-4aa4-85c9-f2111e8bc5c1
# ╠═36836c0b-52c5-462e-b16b-ccfd91ef6cd8
# ╟─97c8a3ef-4e5d-4345-bcd7-c3a8b9af8ddc
# ╠═2db8c172-ee37-4d92-a4c7-f4adf4bcf3fb
# ╟─be0f4422-2ee8-4e52-9b89-9c25314c3598
# ╠═b3d876f8-c2d5-47da-95c5-59302a88a5f2
# ╠═f14672c7-f3a9-4463-b72e-232c01c42b16
# ╟─212737ec-5627-4c71-a3ed-24b665b5e4a4
# ╠═b0a0c386-ecf4-4a37-b89e-da1696c3854f
# ╟─3d2d32c0-f1ef-43e5-8157-61cd0843dd5a
# ╠═1ff5097b-a475-4641-a90b-b117a92f38f4
# ╠═139d3c54-5bb5-46c5-8f2b-8e9a7c790b38
# ╟─f1a6c1e0-ee13-4ad6-aab0-30a36c1a083c
# ╠═2eeef716-95ae-41cc-b69d-f1e8e4545f7b
# ╟─cd23a0b1-4332-4c47-b710-bb89ca60795a
# ╠═f308cbb1-f5df-4220-b1d6-089a237c5fa3
# ╟─98363464-5be1-4861-8ac7-44820aebb6f0
# ╠═199b1f53-e8ef-47a4-8b02-b6442bde97b9
# ╟─3623e025-9879-4888-ab21-269a5cff130e
# ╠═2780a3b2-3a10-47b5-b0dd-3af5ba923a6b
# ╟─5ece1eb8-3ea6-4981-ae40-44cfa32fe3a6
# ╠═43cacce0-e55c-4315-ad2a-35c863b0af1f
# ╟─d677f0a1-615d-4401-917a-8e3a7746435c
# ╠═3e1afcff-e61a-40c0-8e49-a173e628ea60
# ╟─82bae19d-251b-40b6-b8a9-1a0e936297ef
# ╠═464addb2-9e33-48a8-955b-dc71f8d8222e
# ╟─7ce9b5c6-4262-4dd1-996c-3de58d73562d
# ╠═71cb55a8-5724-4719-a31f-1e3e0bb0dfaa
# ╟─5caacb1e-ea96-421a-b1c1-9e30014646c3
# ╠═a866f4d9-3ccc-48db-8922-d8d38e99a7dd
# ╟─9a332088-081f-4eeb-a465-54b79e395f19
# ╠═f9229080-3690-4f65-8ddd-5350d3682a8d
# ╠═f6a05912-4976-4fd4-96f8-ae3c903d6ee1
# ╟─581c5d83-119e-4fe2-bceb-4736d37c7615
# ╠═975453ff-b76e-449a-ae2d-87b1d1b8715d
# ╟─0b96494f-f991-43e1-927e-49c00d7e2569
# ╠═3270a20d-cf30-4cd2-b78b-cd2a6048dd89
# ╟─e332fce6-910a-49f9-8520-bd53a9a857d5
# ╠═11645886-447d-4a8b-b71d-674359d447f8
# ╟─249d4b4b-ad55-41b6-9421-60abcb8a36a9
# ╠═42108fda-7897-4959-b0ff-4a05e75bad5c
# ╠═6787f390-9482-4e43-b1fa-b6bcd2b18fc2
# ╟─81f5a2e7-33ae-402e-9a82-474f9963c832
# ╠═5882af46-0cd0-4036-824f-8456467e84d5
# ╟─1a8a7daf-d6df-49a3-80fe-6c7e9ca3b3bf
# ╠═0eef533d-1b8e-4703-859a-b97acddb5010
# ╠═21a26a75-0369-4991-93e9-83737e7b9bf4
# ╟─94ff7747-2df9-4168-8465-97ae1208c613
# ╠═d758ee6c-e6c3-4227-b917-794e51040a92
# ╠═dbda5337-5800-43fb-9b13-6fdbe4ea2c0c
# ╠═39a850eb-bc9c-4898-b0f9-693e2606fe30
# ╟─f7434fe4-c33d-49e4-a43a-e067a8cff123
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
