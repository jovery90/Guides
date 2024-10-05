// This doc contains the basics for PowerShell

//comments
// Single-line comment

/*
Multi-line comment
*/

//vars
// const, let, and var
var someVariable = 123

//functions
function SomeFunction(){}

//string interpolation
var StringInterpolation = "This is a string…” + someVar

//conditionals
if, else if, else

//operators (and comparison operators), uses PEMDAS
= != == (value) === (value and type) !== ++ -- * / += -= % < > <= >=

// https://www.w3schools.com/js/js_operators.asp

//event listener
function changeHtml(tag) {
    document.getElementById(tag).innerHTML = "Changed"
}

document.getElementById("button1").addEventListener("click", function() { changeHtml("id1") });

//roll dice
function DiceRoll(diceSides)
{
   diceNumber = Math.floor(Math.random() * diceSides) +1;
   return diceNumber
}
*then simply call DiceRoll(6) as if it's a var representing a D6 roll!
