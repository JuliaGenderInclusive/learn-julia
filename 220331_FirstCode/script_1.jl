#### Working in scripts

# Pluto notebooks are great when we have lots of text and not as much code, but you'll often see scripts in an IDE (integrated developer environment, such as VS Code) instead
# Let's take another look at variables in this context

# Assign:
var1 = 4
var2 = 6

result = var1 + var2

println(result)

# To run the script, click on the play button at the top right (make sure any changes are saved). 
# Output will appear in the terminal (which is like a Julia REPL)

# Alternatively, hit Ctrl + Enter to run the line you're in

# Extensions are helpful when writing scripts. 
#Hover over the variables to be reminded of their assignments

# When you start a new script (File -> New file), select the Julia language. This will automatically save the file with the right ending .jl


#### Printing

# The two printing methods in Julia are print() and println()

print("Hello, everyone!")
print("Hi!")

println("Hey =)")
println("How's it going?")

# The difference between those two is that println() will add a new line after the output, and line() won't.

# Print several statements by listing them, comma-separated:

println("The result is: ", result)

# Add line breaks with \n:

println("Line1\nLine2")


#### When things go wrong

# In scripts, the order of assignments matters

println(var2 + var3)

var3 = 10

# We get a UndefVarError - var3 is not defined when it is used
# The script runs up to that point and then fails.
# Have a close look at the error message - it tells you in which line the issue is and lets you jump to it to correct the error

