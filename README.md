# haskell-line-intersect
Intersection parameter and point for two parameterized 2D point-vector lines 

This is a Haskell For Mac project that supports and explores the computation of the intersection, in 2D, 
of two parameterised lines. The focus on parameterized lines is especially useful for the problem of trying to 
detect a possible intersection of a line with a line segment. By expressing the line segment, P0 to P1 as 
a parameterized line, P = P0 + t * (P1 - P0), and solving got the point of intersection in terms of t, then
the line intersects the segment if t is 0 <= t <= 1, and otherwise not. For two segments PA0 PA1 and PB0 PB1,
the intersection computation can be used first for one segment parameter, t, and (by reversing the roles of the 
two segments) for the second segment parameter, u. The two segments intersect, the, when 0 <= t <= 1
and 0 <= u <= 1, otherwise not.

See http://haskellformac.com/ for details on Framework. Note that this exercise contains an illustration that
depends on Hakell for Mac, however, the underlying Haskell code can be easily seperated and used in other
graphics frameworks (e.g. gloss - https://hackage.haskell.org/package/gloss).