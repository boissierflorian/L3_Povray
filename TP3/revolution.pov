#include "colors.inc"

camera {location <0,7,-10> look_at <0,0,0> }
background { White }
light_source { <100,100,-200> rgb 0.9}

lathe {
  linear_spline
  5,
  < 3, 0 >, < 4, 0 >, < 5, 2.5 >, < 4, 4 >, < 3, 4 >
  pigment { YellowGreen }
  finish {ambient .3 phong 1}
}