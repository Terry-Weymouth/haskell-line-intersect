module DrawingTest where

import Graphics.SpriteKit hiding (Path,Point)
import Codec.Picture

import LineGraphics
import LineIntersect

makeVectroLinePicture :: Colour -> LineVector -> Float -> Picture 
makeVectroLinePicture c lineWithVector@((x , y) , (dx , dy)) t =
  [(c, linePath) , (c, circle)]
    where 
      linePath = vectorLinePath lineWithVector t
      circle = pointMarkerYX (x + dx) (y + dy)

makeInterasctionPointPicture :: Colour -> LineVector -> LineVector -> Picture
makeInterasctionPointPicture col line1 line2
  = [(col, cir)]
    where
      point = intersectionPoint line1 line2
      cir = pointMarkerPoint point

makeIntersectionPicture :: Picture
makeIntersectionPicture = 
  (makeVectroLinePicture blue line1 1) 
    ++ (makeVectroLinePicture red line2 1)
    ++ (makeInterasctionPointPicture green line1 line2)
      where
        line1 = ((100 , 0) , (300 , 300))
        line2 = ((100 , 200) , (200 , 0))

test = drawPicture 2.0 $ makeIntersectionPicture

