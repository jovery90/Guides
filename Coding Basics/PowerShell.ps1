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

#loop through array
For ($i=0; $i -le 5; $i++) {
    "Number is: "+$i
    }

