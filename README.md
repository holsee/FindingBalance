Finding Balance
===============

```
         []
[] []    []
[] [] [] [] [] [] 
------------------
        ^
```

Given a list of integer values, find the position in the list where the sum of the values on the left hand side, is equal to the values on the right hand side.

Note: The value at the pivot (index) is included as a value on the right hand side.

#### Example: Even List

```
 0  1  2  3  4  5  6  7
[1, 2, 3, 4, 4, 3, 2, 1]
           ^
```
Pivot at index: 4.

#### Example: Odd List

```
 0  1  2 
[1, 1, 2]
       ^   
```
Pivot at index: 2

### Easy Mode: No Natural Balance Point? Quit!

If there is no natural balanced index, return something that indicates that.
E.g. `{error, unbalanced}`


### Hard Mode: Super Bonus Edge Cases

Finding the sub-index balance point.

#### Example: Odd List with Center Balanced

```
 0  1  2
[1, 2, 1]
	^
```
Pivot at index: 1.5 

### Example: No Natural Pivot Point

```
 0  1    2   3
[1, 1, 1000, 1]
        ^
````
Pivot at index: 2.????


Working Example:

```
0
LHS - 0
RHS - 1003

1
LHS - 1
RHS - 1002

2
LHS - 2
RHS - 1001

3
LHS - 1002
RHS - 1
```

Where between index 2 & 3 would there be a balance point?

I think this works out, feel free to point out flaws in this challenge!
