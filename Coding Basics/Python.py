#This doc contains the basics for Python

#tabs - reminder, Python is strict for tabs

#comments
# Single-line comment

"""
Multi-line string
"""

#vars
someVar = 123

#functions
def my_function():
  #tabbed over, then logic

#classes
class Person:
  def __init__(self, age, name):
    self.age = age
    self.name = name

person1 = Person(14, "Bob")

print(person1.age)
print(person1.name)

#string interpolation
print(“Name:”, name)

#conditionals
if, elif, else
and, or, not

#operators
==, !=, >=, <=
