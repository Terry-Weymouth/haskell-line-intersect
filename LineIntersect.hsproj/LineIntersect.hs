module LineIntersect where

import LineGraphics

pointPlusVector :: Point -> Vector -> Point
pointPlusVector (x , y) (dx , dy) =
  ((x + dx) , (y + dy))

vectorTimeParameter :: Vector -> Float -> Vector
vectorTimeParameter (dx , dy) t =
  ((t * dx) , (t * dy))

vectorLinePath :: LineVector -> Float -> Path
vectorLinePath (point , vector) t =
  [point ,  (pointPlusVector point $ vectorTimeParameter vector t)]

-- pointX[i] = ( sin( i / n * 2 * pi ) * radius ) + xOffset;
-- pointY[i] = ( cos( i / n * 2 * pi ) * radius ) + yOffset;
makeCircle :: Int -> Float -> Float -> 
              Float -> Path
makeCircle 
  n x y r = makeCircle' n 0
    where
      makeCircle' :: Int -> Int -> Path
      makeCircle' n i
        | (i == n)  = [ (( x + r) , y )]
        | otherwise = (xc , yc ) :  makeCircle' n (i + 1)
            where
              xc = (cos $ ((fromIntegral i)/(fromIntegral n)) * 2 * pi) * r + x
              yc = (sin $ ((fromIntegral i)/(fromIntegral n)) * 2 * pi) * r + y

-- intersection of two parametric lines x y dx dy
-- returning the parameter, t, WRT the second line
-- point of intersection is ( (x + t*dx) , (y + t*dy) )  
-- 
intersectionParameter :: LineVector -> LineVector -> Float   
intersectionParameter ((aX , aY) , (aDX , aDY)) ((bX , bY) , (bDX , bDY)) 
  = (f1 - f2) / d
    where
      f1 = aDX * (bY - aY)
      f2 = aDY * (bX - aX)
      d = bDX * aDY - aDX * bDY

intersectionPoint :: LineVector -> LineVector -> Point
intersectionPoint line1 line2@(point2 , vector2)
  = intPoint
    where
      t = intersectionParameter line1 line2
      intPoint = (pointPlusVector point2 $ vectorTimeParameter vector2 t)

pointMarkerPoint :: Point -> Path
pointMarkerPoint (x , y)
  = pointMarkerYX x y

pointMarkerYX :: Float -> Float -> Path
pointMarkerYX x y
  = makeCircle 16 x y 5
  




















