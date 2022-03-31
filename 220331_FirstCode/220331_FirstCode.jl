### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ e6d89203-0d9c-456f-b4ee-399eac74fb8c
md"# Your first Julia code!"

# ╔═╡ 7f25f048-2cb0-4671-9e0a-d6e47422caf9
md"""
From last time:
- Pluto as an IDE -- writing text vs. writing code
- Hiding and showing code
- Basic mathematical operations 
"""

# ╔═╡ 49a4545e-6ca4-4059-8e9f-8ec60f9801b4
md"""
This time: 
- Julia Programming for Nervous Beginners Week 1 on juliaacademy.com
- Learn Julia for Beginners by Logan Kilpatrick: https://www.freecodecamp.org/news/learn-julia-programming-language/
"""

# ╔═╡ 0c3c5d12-d541-4057-a5a7-4ef1348c613c
md"""
## Variables
**Variables: data containers that allow you to name and reuse values**
- Must start with a letter
- Best practice = use only lowercase letters and numbers (no underscores or capitals)
"""

# ╔═╡ bad8536c-f2f1-4699-ae36-e49cef1a129e
md"""
**We *define* ourvariable by assigning a *name* to the *value* of 4.**

**Variable names must be on the left and are assigned to values with =**

**= is an *operator*, (specifically, the assignment operator) which is a special kind of function that is contained in a single character, like + or -**
"""

# ╔═╡ 6252ea34-d268-40ef-bd61-32ec45dae30d
ourvariable = 4

# ╔═╡ 07bed8ca-3553-460a-8317-97b3d37acd30
ourvariable2 = 5

# ╔═╡ c5b304a4-aad9-11ec-1bf8-fdf273cf64ba
md""" Remember: In Pluto notebooks, updating a cell updates any other cell before or after it that depends on that cell
"""

# ╔═╡ afa165dd-9934-48ec-a57f-4d2cbb8ba9b3
ourvariable + 3

# ╔═╡ 7f81d0b3-fcd3-4122-95db-a845da803a20
ourvariable + ourvariable2

# ╔═╡ b4e46f76-9280-427a-a51c-311b83eebb35
#You can even make new variables using existing ones
ournewvariable = ourvariable + 1

# ╔═╡ 49758e64-b4c9-49b7-b124-310ed0327120
#Or define several variables at once
favnumber1, favnumber2 = 12, 27

# ╔═╡ d4846289-cf1b-4c41-8807-64e5a930bbb5
favnumber2 - favnumber1

# ╔═╡ d1740253-ef1f-4948-97a8-eccf473891e5
md""" 
**These variables are both numeric. We can show variable types with `typeof()` -- our first function!**

**This function takes as input one argument, the object you want to return the type of.**

**Julia is *dynamically typed*, so you don't have to specify the type of an object -- Julia will make its best guess.**
"""

# ╔═╡ c508461f-5542-42dc-bf46-f2897b57e38e
typeof(ourvariable)

# ╔═╡ 85cee88f-87f9-479c-b027-a079b7093aec
typeof(4.52)

# ╔═╡ fb32c913-858c-4415-9f17-b65ccddeaf20
typeof("Hello")

# ╔═╡ 6f6cf36a-aa68-471e-9385-ad12a3e86c72
typeof('h')

# ╔═╡ e40d1c1d-c3a3-415f-b47f-5f6f080fd211
md"""
**As you can see above, Floats are numbers that can include decimal places. Strings are longer text sequences enclosed in double quotes (") and characters are single letters enclosed in single quotes ('). These are called *delimiters* because they tell Julia where the object starts and ends.**
"""

# ╔═╡ 7a5e34da-f2b3-42bb-87aa-06688490ffa2
#In Julia, you can even use emojis as variable names! Type \: tab and tab again
🍉 = 3

# ╔═╡ 9a1fc159-8b89-4c8a-baa3-0cf9876127fb
#Same with Greek letters, mathematical symbols, and characters from other languages. Type \, begin typing the symbol name (as in Latex) and tab complete and tab again to fill in it Pluto
α = 4

# ╔═╡ 64b6a17c-a068-43fd-82cb-f776cc80896c
md"""
**Types matter because Julia may take different action depending on the type of the object that a function or operator is assigned to**

**For example: For floats and integers, the asterisk * is the multiplication operator and + is the addition operator.**
"""

# ╔═╡ 58607f1d-9217-4db3-9d74-e0c65beba17e
10928 + 4

# ╔═╡ d9898396-c418-4536-9a4e-31c3dbe77070
md"**But for string and character objects, * is the concatenator, which returns the two strings or characters as a single string.**"

# ╔═╡ 4259795e-6433-4326-9e26-dc05b4d0ab3a
greeting = "Howdy, "

# ╔═╡ ab5f92f6-6893-4470-940c-32f34b9b4ecb
guest = "Madam President"

# ╔═╡ a10e5f7f-e3a9-46a1-b729-d828dfdcd70f
md"**And some operators or functions won't work on objects of certain types:**"

# ╔═╡ 753d21c2-e183-4df9-a545-5fce2e61bfbb
"Hi there, " + "friends"

# ╔═╡ 2a7c7b0d-3f70-4e5a-b761-2b23c1647610
md"### Exercises"

# ╔═╡ 576eb221-2ca5-4059-a989-5483fdd314d0
md"1) Make a variable called name and assign it to your name. What type is it? *Note: You can only have one line of code in each Pluto box, so you may need to add another one here!*"

# ╔═╡ 3a7b2adf-09c9-4a64-bc83-e072694bbc3b


# ╔═╡ 732db5e6-19d5-4474-b025-c6b3d17ce9af
md"2. Make a variable called guests and assign it to the number of guests you would want to invite to a pizza party."

# ╔═╡ 6c920f40-0146-4991-bb52-96cf6657f008


# ╔═╡ 0c413a72-b978-4193-9931-1867a82ea1a1
md"3. Make a variable called pizzas and assign it to the number of pizzas you'd have to order for your pizza party."

# ╔═╡ d74a8ffd-0d24-47ee-83e7-1457ed98823d


# ╔═╡ ca2c9ff5-807b-4663-a130-42330088fa0d
md"4. Calculate how much pizza each person would get by dividing the number of pizzas by the number of guests!"

# ╔═╡ fd9b22d1-c98c-4651-9b85-737bfcf9e7d6


# ╔═╡ bc9c6bd6-e4ca-47f6-a339-ed7c7ca15fc1
md"**Bonus: Go back to exercise 1 and add a semicolon ; at the end of the line where you define the name variable. What does it do?**"

# ╔═╡ 531f67a0-7b5f-4cfe-a5e8-fd97d6f072e4
md"## Error messages"

# ╔═╡ b58b5fa4-d0d1-4e84-a465-5e3d43bc10a0
md"**Decoding error messages is crucial! Take a look at those below:**"

# ╔═╡ d9a68e65-1940-41ef-bb4c-0ad13be2f4e5
"Hello" = myvariable3

# ╔═╡ b53ed81b-9163-4121-b4db-8311022bf7eb
= myvariable3

# ╔═╡ 2600eee5-367f-4dd8-9180-10ba1e7fd174
typeof()

# ╔═╡ 55a9d285-d27f-41e8-9484-fa16e3bf3b53
length("Kyla")

# ╔═╡ 3e2e77cd-e8fb-4065-b3e3-73dfcb6a14bf
length("Kyla" "Julia")

# ╔═╡ 4153e244-9b1e-41fe-92df-4190020f7cef
md"""
**A useful feature of Pluto is the Live docs in the bottom right, which instantly pull up the documentation of any function you type in a code box**

**For example, let's pull up the documentation for length and typeof, as well as a new function, uppercasefirst**
"""

# ╔═╡ 51455521-8184-4ca2-bcb7-54935b18dd4c


# ╔═╡ 6c230533-0d2b-46f1-88c7-8ed03b08c252
md"""
## Exercises

1. Use the Live docs to figure out what the operator ^ does to Integer objects vs. to String objects. Once you have a guess, try it out with the expressions: `4^2` and `"Julia"^2`

"""

# ╔═╡ ce33a58c-6d2c-4081-9593-30de9e20086c


# ╔═╡ a36ea610-b906-4bde-9211-5cfd02f55c40
md"2. Find the errors in the code below and correct them to make valid Julia expressions."

# ╔═╡ bc62d341-8837-497c-9de2-3b8f5cfc0ed2
1letter = 'c'

# ╔═╡ a1b6f24d-6691-432d-996e-f3f985f381d4
👩 = 🍉 * 10

# ╔═╡ 2d9eb09a-0e51-492c-a096-86e97d1db9ff
112 * 47

# ╔═╡ 751da5e1-18b6-4c54-a61b-bfc96ec3a4b1
ourvariable * ourvariable2

# ╔═╡ 94b83384-14ea-483a-9de5-9fdfe8149743
4.27 * 1.32

# ╔═╡ 226ff04b-73b5-4676-9fee-e7a7e705c951
"Hi there, " * "friends"

# ╔═╡ 8ac90022-8ed5-46a9-abf5-391d87acb555
'a' * 'b'

# ╔═╡ 7a359701-d01d-4747-8c88-3276a49ca15d
"Good mornin" * 'g'

# ╔═╡ f5c53401-deeb-4d09-a7d4-f7c2c62c9b60
greeting * guest

# ╔═╡ 57fa06c0-8121-4075-b0f6-23f84dbf3c42
typeof("hello", "hi")

# ╔═╡ 3fe0396c-d2f6-483b-b2d1-85ee0724d1c9
typeof(myvaribale2)

# ╔═╡ 0bffc42e-7a63-4550-84f6-56d32e353a41
uppercasefirst('c')

# ╔═╡ Cell order:
# ╟─e6d89203-0d9c-456f-b4ee-399eac74fb8c
# ╟─7f25f048-2cb0-4671-9e0a-d6e47422caf9
# ╟─49a4545e-6ca4-4059-8e9f-8ec60f9801b4
# ╟─0c3c5d12-d541-4057-a5a7-4ef1348c613c
# ╟─bad8536c-f2f1-4699-ae36-e49cef1a129e
# ╠═6252ea34-d268-40ef-bd61-32ec45dae30d
# ╠═07bed8ca-3553-460a-8317-97b3d37acd30
# ╟─c5b304a4-aad9-11ec-1bf8-fdf273cf64ba
# ╠═afa165dd-9934-48ec-a57f-4d2cbb8ba9b3
# ╠═7f81d0b3-fcd3-4122-95db-a845da803a20
# ╠═b4e46f76-9280-427a-a51c-311b83eebb35
# ╠═49758e64-b4c9-49b7-b124-310ed0327120
# ╠═d4846289-cf1b-4c41-8807-64e5a930bbb5
# ╟─d1740253-ef1f-4948-97a8-eccf473891e5
# ╠═c508461f-5542-42dc-bf46-f2897b57e38e
# ╠═85cee88f-87f9-479c-b027-a079b7093aec
# ╠═fb32c913-858c-4415-9f17-b65ccddeaf20
# ╠═6f6cf36a-aa68-471e-9385-ad12a3e86c72
# ╟─e40d1c1d-c3a3-415f-b47f-5f6f080fd211
# ╠═7a5e34da-f2b3-42bb-87aa-06688490ffa2
# ╠═a1b6f24d-6691-432d-996e-f3f985f381d4
# ╠═9a1fc159-8b89-4c8a-baa3-0cf9876127fb
# ╟─64b6a17c-a068-43fd-82cb-f776cc80896c
# ╠═2d9eb09a-0e51-492c-a096-86e97d1db9ff
# ╠═751da5e1-18b6-4c54-a61b-bfc96ec3a4b1
# ╠═94b83384-14ea-483a-9de5-9fdfe8149743
# ╠═58607f1d-9217-4db3-9d74-e0c65beba17e
# ╟─d9898396-c418-4536-9a4e-31c3dbe77070
# ╠═226ff04b-73b5-4676-9fee-e7a7e705c951
# ╠═8ac90022-8ed5-46a9-abf5-391d87acb555
# ╠═7a359701-d01d-4747-8c88-3276a49ca15d
# ╠═4259795e-6433-4326-9e26-dc05b4d0ab3a
# ╠═ab5f92f6-6893-4470-940c-32f34b9b4ecb
# ╠═f5c53401-deeb-4d09-a7d4-f7c2c62c9b60
# ╟─a10e5f7f-e3a9-46a1-b729-d828dfdcd70f
# ╠═753d21c2-e183-4df9-a545-5fce2e61bfbb
# ╟─2a7c7b0d-3f70-4e5a-b761-2b23c1647610
# ╟─576eb221-2ca5-4059-a989-5483fdd314d0
# ╠═3a7b2adf-09c9-4a64-bc83-e072694bbc3b
# ╟─732db5e6-19d5-4474-b025-c6b3d17ce9af
# ╠═6c920f40-0146-4991-bb52-96cf6657f008
# ╟─0c413a72-b978-4193-9931-1867a82ea1a1
# ╠═d74a8ffd-0d24-47ee-83e7-1457ed98823d
# ╟─ca2c9ff5-807b-4663-a130-42330088fa0d
# ╠═fd9b22d1-c98c-4651-9b85-737bfcf9e7d6
# ╟─bc9c6bd6-e4ca-47f6-a339-ed7c7ca15fc1
# ╟─531f67a0-7b5f-4cfe-a5e8-fd97d6f072e4
# ╟─b58b5fa4-d0d1-4e84-a465-5e3d43bc10a0
# ╠═d9a68e65-1940-41ef-bb4c-0ad13be2f4e5
# ╠═b53ed81b-9163-4121-b4db-8311022bf7eb
# ╠═2600eee5-367f-4dd8-9180-10ba1e7fd174
# ╠═55a9d285-d27f-41e8-9484-fa16e3bf3b53
# ╠═3e2e77cd-e8fb-4065-b3e3-73dfcb6a14bf
# ╟─4153e244-9b1e-41fe-92df-4190020f7cef
# ╠═51455521-8184-4ca2-bcb7-54935b18dd4c
# ╟─6c230533-0d2b-46f1-88c7-8ed03b08c252
# ╠═ce33a58c-6d2c-4081-9593-30de9e20086c
# ╟─a36ea610-b906-4bde-9211-5cfd02f55c40
# ╠═bc62d341-8837-497c-9de2-3b8f5cfc0ed2
# ╠═57fa06c0-8121-4075-b0f6-23f84dbf3c42
# ╠═3fe0396c-d2f6-483b-b2d1-85ee0724d1c9
# ╠═0bffc42e-7a63-4550-84f6-56d32e353a41
