#include "colors.inc"

camera {location <0,7,-10> look_at <0,0,0> }
background { White }
light_source { <100,100,-200> rgb 0.9}

lathe {
  quadratic_spline
  7,
  < 2, 0 >, < 2.2, 0 >, < 3, 0.5 >, < 2.25, 3 >, <3, 4>, <2.5, 4.4>, <2, 4.1>
  pigment { YellowGreen }
  finish {ambient .3 phong 1}
}