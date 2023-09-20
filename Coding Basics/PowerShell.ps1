# This doc contains the basics for PowerShell

#comments
# Single-line comment

<#
Multi-line comment
#>

#vars
$someVar

#functions
#params are separated by spaces, not commas
function SomeFunction(){}

#string interpolation
"Some string and a var - $($someVar)"

#special char string interpolation
"Some string and a var - ${someVar}"

#single vs double quotes
#single - will not process interpolation, it's literal
#double - will process interpolation


#conditionals
if, elseif, else

#operators
-eq, , -ne, -lt, -gt

#initialize array
$array = @()

#looping
For ($i=0; $i -le 5; $i++) {
    "Number is: "+$i
    }

#array methods
.RemoveAt    #array.RemoveAt($index)
.Remove      #array.Remove($object)
$newArray = "a", "b", "c", "d"
$newArray = $oldArray[0, 1, 3] #creating new array based on just 3 values of old array

#split
$teststring -split "-"
