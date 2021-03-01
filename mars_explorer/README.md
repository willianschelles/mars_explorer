# MarsExplorer

This space probe walks on a mesh of size NxN, and executes the following commands:
"L", "R," and "M" left, right and move, respectively.

Respecting the limits of the mesh and the directions of the wind rose, for each command, 
we have a new combination of coordinates / pointed direction 

wind rose directions: ("N", "S", "E", "W").

An example of an entry is:
(x, y, direction)
(1, 2, "N")
given the command "L" we will have the new combination:
(1,2, "W")
given the command "M" we will have the new combination:
(0, 2, "W")
once the probe has moved to the `x-1` position and so on.
