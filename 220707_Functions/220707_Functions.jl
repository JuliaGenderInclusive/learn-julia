### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ a34b5990-e33c-11ec-0e02-af0897cee34a
md"# Learn Julia with us 5: Functions"

# ╔═╡ 2390dff3-8d4b-41ba-bce9-30c013a271a0
md"## In-built functions
### The string function
The string function lets us combine several values into a single string.
"

# ╔═╡ 25ab7e83-fdb5-486d-bc48-ffa9e5458145
string("s", 10, "a")

# ╔═╡ a03e9b56-8647-4032-a030-f3c124910abc
string(true, "xyz", 5, false)

# ╔═╡ 8be9bb2c-9802-4f5e-b168-13ac1c409eb3
md"
The comma is used as a delimiter (to separate values).
This function can take several types as input and converts them to strings.
"

# ╔═╡ 2822a41d-ea51-49c6-b034-17bbe4f06e9a
typeof(string(true, "xyz", 5, false))

# ╔═╡ cd312abf-a604-4493-8c38-a759d0e6a9fd
md"
It also works for symbols that can be interpreted as operators:
"

# ╔═╡ 8543e6e8-ff83-46e2-971b-ca1ad3bb1aef
string(+, "hi", *)

# ╔═╡ b9c4f3c0-32c0-488b-b28d-78d117853b97
md"
The string function has pad as an optional keyword. It automatically inserts 0 until the number of digits matches what we provided:
"

# ╔═╡ afa423bf-71cd-4d8d-b14d-5455d677ba92
string(2523, pad = 20)

# ╔═╡ 0f2d5cb8-3103-4135-b56c-13ec94c3689e
md"
pad only works for integers (whole numbers), so an error will occur when we try this with a character or string (or a float). This shows that Julia can do different operations based on the input type"

# ╔═╡ 529b401f-92ea-4f6e-b606-e2094daf0e81
string("a", pad = 10)

# ╔═╡ ac2ffd82-3d0d-4850-8454-cbcf0ea887f3
md"
### The join function
This function works on a container (such as an array) and joins its elements into a string. 
"

# ╔═╡ 6da9e706-0fdd-42bf-9c08-f72be29e1b55
begin
	strarray = ["a", "bb", "ccc", "dddd"]
	join(strarray)
end

# ╔═╡ ec3bc493-3dbb-4417-a9e7-e74da37a02c4
md"
We can specifiy which delimiter we'd like to use:
"

# ╔═╡ 71fc819f-1097-4db9-9c0e-141c81dd97ae
join(strarray, " - ")

# ╔═╡ 774ee373-f15a-48df-97fb-6cbed052e9bb
md"
If we check the help/live docs for the join function, we can see that the delimiter argument is optional (indicated by the square brackets).

There's another optional argument here: last. It determines what the delimiter between the last two elements should be - so this can be different from the rest:
"

# ╔═╡ f094b947-f700-42fa-a706-a9b9bd6760fe
join(strarray, " - ", " ; ")

# ╔═╡ 1a0f6244-f653-46b6-a4e6-24d63422fed9
md"
...but this second optional argument only works if we've specified a delimiter, even if we just wanted to insert no additional characters between the elements we're joining:
"

# ╔═╡ 259dea79-c020-4fb5-b392-6893c14523a4
join(strarray, , ";")

# ╔═╡ 4c0d3157-16b2-4526-a382-758fb602786d
md"
This doesn't work because there's no default for the delimiter keyword.

If we call methods() on join, it'll tell us that join is a generic function with 6 different methods for this one function. This also shows again that we can't use strings and last but need delim, too.
"

# ╔═╡ 255404b3-d78e-472d-82b9-dfd4be770421
methods(join)

# ╔═╡ 8ca63485-332b-4872-a25c-e51e5b494062
md"## User-defined functions
We can write our own functions! As a first example, let's look at code that reverses the characters in a string:
"

# ╔═╡ 7d657f2f-40f8-40f5-8729-2b3652594b3d
begin
	str = "hello"
	str[end:-1:1] # take steps from the last index to the first
end

# ╔═╡ 4295f378-55c2-4cc2-82ad-83052f6a651d
md"
If we want to re-use this code several times, it would make sense to put it into a function that we can just call whenever we want to reverse a string.
"

# ╔═╡ b31bffbc-f341-47d3-b5f1-9f3133b4bbe1
md"
### Making functions with function ... end
Julia has the reserved keyword function. It needs to be followed by the name you want to give the function, then round brackets which contain the argument list.
The body of the function follows (= what should be done with the input). Then, we use another keyword, return, to return the output of the function, and the end keyword to close the function block.
"

# ╔═╡ 24f13b01-17a1-4a82-8cbe-f0bb097a1d3f
function str_reverse(in_str)
	out_str = in_str[end:-1:1]
	return out_str
end

# ╔═╡ d75afb06-7d98-4a33-b223-bffb72a55204
str_reverse("hello")

# ╔═╡ 621d4437-ee1b-4b93-91a5-1862330cbc43
md"
Another example - let's write a function that introduces the user when they type in their name and where they live.
"

# ╔═╡ 63e6072f-b1a8-49a4-af4b-4785ab4da9e3
function introductions(name, place)
	sentence = "I'm $name and I live in $place"
	return sentence
end

# ╔═╡ 258e3d69-5f04-4699-85ad-c32705d4d3a6
introductions("Julia", "Freiburg")

# ╔═╡ 11fca24b-8497-45cb-ae0f-23bd3fa15fca
md"
When picking a name for your function, make sure it doesn't use reserved keywords (end, return...) or type names. Julia will warn you if you use an invalid name. The same rules as for variable names apply.
Function names with exclamation marks and underscores are discouraged (but don't throw errors).

Whenever you write a function, make sure to test it: it should give you the output you expect, but also fail in expected ways.

### Functions without return
It's possible to leave out the return keyword. Julia then just returns the last value that was calculated.
"

# ╔═╡ ba65cffd-8f45-41f0-b49e-cd6c07c47b0e
function someMaths(num1, num2)
	added = num1 + num2
	multiplied = added * 2
end

# ╔═╡ 70f26436-76ed-42ab-90ce-8935feac6402
someMaths(4, 2)

# ╔═╡ 2f0b4199-cb4a-4734-966d-a0aadafcd27b
md"
### Inline functions
Actually, all keywords can be omitted and short functions can be rewritten as inline functions in the format: functionName(arguments) = expression.
"

# ╔═╡ d11a8d5c-691b-40ff-926d-67cf17a34da6
moreMaths(n1, n2) = n1 - n2

# ╔═╡ bb245157-2273-4d80-9f04-3a6427a1f413
moreMaths(3,5)

# ╔═╡ acd2e1d8-0ad7-4784-a4ee-a7c47cb4b426
md"
### Writing functions with different methods
We'll write a function that doubles the input - but this means different things depending on whether the input is a number or text. A number needs to be multiplied by 2, text needs to be printed twice.

The function double has two methods depending on the input. We use the operator :: to specify which format the input has.
"

# ╔═╡ bd8b7e8b-dd53-4198-9ebe-3350e9115d63
begin
	double(x::Int64) = 2x
	double(x::String) = x^2
end

# ╔═╡ fb20e944-074c-4694-bd12-523ea377bb99
md"Julia informs us that the double function has two methods - functions with more than one method are called generic functions. We can have another look at them by calling methods():"

# ╔═╡ 56590d5a-a751-4ce2-9231-0599e9b3980f
methods(double)

# ╔═╡ c17d5792-b5a9-4a50-9f7a-7f540eac8110
md"
In other words, these are the type signature of this function - the list of types a function can take. The method of a function is what is being done with the input.

Let's test the double function and see how it does with different inputs:"

# ╔═╡ e3982bd6-6842-4ef1-9e8f-a423f06ce8bd
double(5)

# ╔═╡ 36d01970-9a85-49bb-95da-569ab35f9ff9
double("hi")

# ╔═╡ 0efe8f25-096e-467a-83d0-3378fbb59568
double(2.7) # doesn't work because we didn't specify what to do with floats

# ╔═╡ 0718a4b9-4755-4110-87f3-f6607b145ac7
double('a')

# ╔═╡ d59454da-79d0-4969-9320-7644617a521b
md"
## The type system
### Abstract types
To make the double function work with float inputs, we could either specify a method for floats, or make use of the abstract type Number.
"

# ╔═╡ fb5eac2e-c423-45d8-b3ca-9bddee7b9349
begin
	double_fixed(x::Number) = 2x
	double_fixed(2.6)
end

# ╔═╡ 6ba6d90d-8ecc-4d73-a3d9-194e08b2cc6d
md"
Alternatively, we can also write a default method for Julia to fall back into when other types do not apply. The double2 function has one method for strings and one method for all other types, which we specify with ::Any
"

# ╔═╡ 9382ccc3-60a7-4055-a0bf-627b4f0122ef
begin
	double2(x::String) = x^2
	double2(x::Any) = x*2
end

# ╔═╡ 74729a2a-8a73-4283-896b-91795b05b55f
double2("This works! ")

# ╔═╡ 7b458a60-48b4-4e18-b9c9-b4fc0306b579
double2(3)

# ╔═╡ fe426bb2-af31-46b2-a20e-646b3f5d37f0
double2(1.8)

# ╔═╡ e0e66068-385e-4957-bb75-ff070a5c9338
md"
So abstract types subsume several types, which are their subtypes (the opposite is called supertypes). We can check the subtypes of Number:
"

# ╔═╡ 354d4c54-e554-4681-a28f-2cd970d1d16e
subtypes(Number)

# ╔═╡ 6cf5b1bd-88d7-48b4-865e-452a3fef5adf
md"It can be broken down into the subtypes Complex and Real. If we call subtypes on Real, we get floats and integers."

# ╔═╡ 09315812-4cea-4647-860a-8599609a4d92
subtypes(Real)

# ╔═╡ 6fa39386-2798-4f1c-b50d-8966537a5c87
subtypes(AbstractFloat)

# ╔═╡ 01e66979-565d-4845-b55a-b00f68a3946f
md"Reversely, we can check what the supertype of Float64 is:"

# ╔═╡ f951e8b6-12a1-4db7-8f15-d0cf834fd773
supertype(Float64)

# ╔═╡ cc7c8465-abd1-47ff-beaa-d2271d8f29ed
md"The eventual supertype of everything is Any - so the type system is arranged in a tree shape."

# ╔═╡ 295ffdf6-c66c-4155-b702-c706218aab52
supertype(Number)

# ╔═╡ 1e3a4a1e-8c1e-45af-bb6a-c6182fb07161
md"Concrete types have no subtypes:"

# ╔═╡ de9b2b74-6c56-4401-88fa-36f2a96c8347
subtypes(Float64)

# ╔═╡ 35489b0d-2763-46a8-a5e2-99d2dbbb03ca
md"In arrays, Julia tries to coerce all elements to the same type:"

# ╔═╡ f8ef3f29-3fae-4b0c-a234-98a16adf5858
[1, 1.0]

# ╔═╡ ccbcf076-cd40-4b27-8567-50062956f390
md"But we can also allow for arrays with mixed types by declaring them to be of an abstract type, such as Any or Number:"

# ╔═╡ c65b2d00-41df-46aa-b948-2c04b8277d06
Number[1, 1.0]

# ╔═╡ aa759900-aab6-4add-97c3-1990092304ca
md"
### Multiple dispatch
How is a method chosen when a function has several methods? Julia searches for type specifications that match the provided values. If no method matches the concrete type, it looks for a method that matches the supertype.
"

# ╔═╡ 31e7405f-f8a8-4dbf-9eb3-765054167f25
begin
	disptype(x::Int64, y) = Text("x requires Int64, y can be Any")
	disptype(x, y::Int64) = Text("x can be Any, y requires Int64")
end

# ╔═╡ 7e36c013-4cac-4c77-8858-f31fcb77550a
disptype(7, 7.0)

# ╔═╡ b4b550bc-1377-4199-9147-fcbd0352c95b
disptype(7.0, 7.0)

# ╔═╡ b1014c7f-3fc9-42df-938b-197022819d7c
disptype(7.0, 7)

# ╔═╡ cf38f3ba-4655-48cc-9d31-abe8d52b6eb6
disptype(7, 7)

# ╔═╡ a61ce20b-428b-42db-989a-53b8272b8880
md"This last example leads to an error warning us about ambiguity - which is something we want to avoid when writing code.
"

# ╔═╡ 05f7b74e-00db-44c2-bf22-ba6cfa02b430
md"
### Scope in programming
Scope is concerned with which variables are accessible in which parts or code blocks of a script. Scope can be local or global. 

In comprehensions, for example, a local variable is used:
"

# ╔═╡ 3e59cc69-ab6d-43d1-a499-fab9c02096dd
begin
	some_text = "scope"
	some_text_2 = [local_variable^2 for local_variable in some_text]
end

# ╔═╡ 18609e89-2dda-448e-b022-f032e3314135
md"This variable isn't available outside the comprehension:"

# ╔═╡ 774b4189-ab3b-4aa8-b370-63f3aeff61cd
local_variable^2

# ╔═╡ 6261d885-d25e-4b9b-98b3-26d13ead57c1
md"
The keyword function introduces a local scope which ends with the end keyword - variables inside a function cannot be used outside of it.

Within functions, global variables can be read, but are not available for writing - unless the keyword global is used. In the example below, y is a global variable (we'll demonstrate in the REPL because Pluto doesn't allow for this).
"

# ╔═╡ ecbaf54b-17df-4241-9038-84a1205d89bf
# ╠═╡ disabled = true
#=╠═╡
function fun_test(x,y)
	z = x+y
	y = 4
	return z
end
x, y = 8, 2 # multiple assignment
fun_test(x,y)
y # is still 2 - but if we change y to global y in the function, it's 4
  ╠═╡ =#

# ╔═╡ fb2d6e33-21f8-4daf-9a24-c49f96e9f4c3
md"We can, however, change elements inside of arrays even if they're global variables without using the global keyword."

# ╔═╡ 314c5af4-9076-40e9-bfd1-ee19e626d3b5
ex_array = [5, 2, 6, 1]

# ╔═╡ 219aa7b1-c54f-4803-81f8-4722f1d00958
function mod_array()
	ex_array[3] = -10
end

# ╔═╡ d4c5eb90-e0c7-4115-921e-f14d4e3b950d
mod_array()

# ╔═╡ b831182c-f490-43ce-bd58-98e6d6fccd40
ex_array # 3rd element has been changed to -10

# ╔═╡ 6ed5c899-dab5-46a7-8fa0-8919a04f4afc
md"When an array-valued variable is assigned to a second names, both names always bind to the same value. Changing elements in that value changes both variables."

# ╔═╡ 8fe28906-2dec-4098-95a5-e012599eda69
begin
	array1 = [7, 2, 4]
	array2 = array1
	array1[1] = 3
end

# ╔═╡ f9d93062-b0aa-4902-969b-b9497ab2944e
array1

# ╔═╡ 7baf887d-fdfd-4497-b53d-2b7836c4cd4a
array2

# ╔═╡ d92f9927-06fe-40e5-97c0-bd324ca10fb4
md"The reason for this (unexpected) behaviour is performance - because arrays can be so big, they're not copied, but instead, both array1 and array2 are assigned to the same memory."

# ╔═╡ Cell order:
# ╟─a34b5990-e33c-11ec-0e02-af0897cee34a
# ╟─2390dff3-8d4b-41ba-bce9-30c013a271a0
# ╠═25ab7e83-fdb5-486d-bc48-ffa9e5458145
# ╠═a03e9b56-8647-4032-a030-f3c124910abc
# ╟─8be9bb2c-9802-4f5e-b168-13ac1c409eb3
# ╠═2822a41d-ea51-49c6-b034-17bbe4f06e9a
# ╟─cd312abf-a604-4493-8c38-a759d0e6a9fd
# ╠═8543e6e8-ff83-46e2-971b-ca1ad3bb1aef
# ╟─b9c4f3c0-32c0-488b-b28d-78d117853b97
# ╠═afa423bf-71cd-4d8d-b14d-5455d677ba92
# ╟─0f2d5cb8-3103-4135-b56c-13ec94c3689e
# ╠═529b401f-92ea-4f6e-b606-e2094daf0e81
# ╟─ac2ffd82-3d0d-4850-8454-cbcf0ea887f3
# ╠═6da9e706-0fdd-42bf-9c08-f72be29e1b55
# ╟─ec3bc493-3dbb-4417-a9e7-e74da37a02c4
# ╠═71fc819f-1097-4db9-9c0e-141c81dd97ae
# ╟─774ee373-f15a-48df-97fb-6cbed052e9bb
# ╠═f094b947-f700-42fa-a706-a9b9bd6760fe
# ╟─1a0f6244-f653-46b6-a4e6-24d63422fed9
# ╠═259dea79-c020-4fb5-b392-6893c14523a4
# ╟─4c0d3157-16b2-4526-a382-758fb602786d
# ╠═255404b3-d78e-472d-82b9-dfd4be770421
# ╟─8ca63485-332b-4872-a25c-e51e5b494062
# ╠═7d657f2f-40f8-40f5-8729-2b3652594b3d
# ╟─4295f378-55c2-4cc2-82ad-83052f6a651d
# ╟─b31bffbc-f341-47d3-b5f1-9f3133b4bbe1
# ╠═24f13b01-17a1-4a82-8cbe-f0bb097a1d3f
# ╠═d75afb06-7d98-4a33-b223-bffb72a55204
# ╟─621d4437-ee1b-4b93-91a5-1862330cbc43
# ╠═63e6072f-b1a8-49a4-af4b-4785ab4da9e3
# ╠═258e3d69-5f04-4699-85ad-c32705d4d3a6
# ╟─11fca24b-8497-45cb-ae0f-23bd3fa15fca
# ╠═ba65cffd-8f45-41f0-b49e-cd6c07c47b0e
# ╠═70f26436-76ed-42ab-90ce-8935feac6402
# ╟─2f0b4199-cb4a-4734-966d-a0aadafcd27b
# ╠═d11a8d5c-691b-40ff-926d-67cf17a34da6
# ╠═bb245157-2273-4d80-9f04-3a6427a1f413
# ╟─acd2e1d8-0ad7-4784-a4ee-a7c47cb4b426
# ╠═bd8b7e8b-dd53-4198-9ebe-3350e9115d63
# ╟─fb20e944-074c-4694-bd12-523ea377bb99
# ╠═56590d5a-a751-4ce2-9231-0599e9b3980f
# ╟─c17d5792-b5a9-4a50-9f7a-7f540eac8110
# ╠═e3982bd6-6842-4ef1-9e8f-a423f06ce8bd
# ╠═36d01970-9a85-49bb-95da-569ab35f9ff9
# ╠═0efe8f25-096e-467a-83d0-3378fbb59568
# ╠═0718a4b9-4755-4110-87f3-f6607b145ac7
# ╟─d59454da-79d0-4969-9320-7644617a521b
# ╠═fb5eac2e-c423-45d8-b3ca-9bddee7b9349
# ╟─6ba6d90d-8ecc-4d73-a3d9-194e08b2cc6d
# ╠═9382ccc3-60a7-4055-a0bf-627b4f0122ef
# ╠═74729a2a-8a73-4283-896b-91795b05b55f
# ╠═7b458a60-48b4-4e18-b9c9-b4fc0306b579
# ╠═fe426bb2-af31-46b2-a20e-646b3f5d37f0
# ╟─e0e66068-385e-4957-bb75-ff070a5c9338
# ╠═354d4c54-e554-4681-a28f-2cd970d1d16e
# ╟─6cf5b1bd-88d7-48b4-865e-452a3fef5adf
# ╠═09315812-4cea-4647-860a-8599609a4d92
# ╠═6fa39386-2798-4f1c-b50d-8966537a5c87
# ╟─01e66979-565d-4845-b55a-b00f68a3946f
# ╠═f951e8b6-12a1-4db7-8f15-d0cf834fd773
# ╟─cc7c8465-abd1-47ff-beaa-d2271d8f29ed
# ╠═295ffdf6-c66c-4155-b702-c706218aab52
# ╟─1e3a4a1e-8c1e-45af-bb6a-c6182fb07161
# ╠═de9b2b74-6c56-4401-88fa-36f2a96c8347
# ╟─35489b0d-2763-46a8-a5e2-99d2dbbb03ca
# ╠═f8ef3f29-3fae-4b0c-a234-98a16adf5858
# ╟─ccbcf076-cd40-4b27-8567-50062956f390
# ╠═c65b2d00-41df-46aa-b948-2c04b8277d06
# ╟─aa759900-aab6-4add-97c3-1990092304ca
# ╠═31e7405f-f8a8-4dbf-9eb3-765054167f25
# ╠═7e36c013-4cac-4c77-8858-f31fcb77550a
# ╠═b4b550bc-1377-4199-9147-fcbd0352c95b
# ╠═b1014c7f-3fc9-42df-938b-197022819d7c
# ╠═cf38f3ba-4655-48cc-9d31-abe8d52b6eb6
# ╟─a61ce20b-428b-42db-989a-53b8272b8880
# ╟─05f7b74e-00db-44c2-bf22-ba6cfa02b430
# ╠═3e59cc69-ab6d-43d1-a499-fab9c02096dd
# ╟─18609e89-2dda-448e-b022-f032e3314135
# ╠═774b4189-ab3b-4aa8-b370-63f3aeff61cd
# ╟─6261d885-d25e-4b9b-98b3-26d13ead57c1
# ╠═ecbaf54b-17df-4241-9038-84a1205d89bf
# ╟─fb2d6e33-21f8-4daf-9a24-c49f96e9f4c3
# ╠═219aa7b1-c54f-4803-81f8-4722f1d00958
# ╠═314c5af4-9076-40e9-bfd1-ee19e626d3b5
# ╠═d4c5eb90-e0c7-4115-921e-f14d4e3b950d
# ╠═b831182c-f490-43ce-bd58-98e6d6fccd40
# ╟─6ed5c899-dab5-46a7-8fa0-8919a04f4afc
# ╠═8fe28906-2dec-4098-95a5-e012599eda69
# ╠═f9d93062-b0aa-4902-969b-b9497ab2944e
# ╠═7baf887d-fdfd-4497-b53d-2b7836c4cd4a
# ╟─d92f9927-06fe-40e5-97c0-bd324ca10fb4
