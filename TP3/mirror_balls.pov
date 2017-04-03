#include "colors.inc"

light_source { <50,50,-50> color White }
camera { location <3,-4,-3> look_at <0,0,0> sky <0,0,-1>}

sphere {<-2,0,-1>, 1 texture{pigment{color Blue}finish{ reflection 1 }} }
sphere {< 0,0,-1>, 1 texture{pigment{color Red }finish{ reflection 1 }} }
sphere {< 2,0,-1>, 1 texture{pigment{color Gray}finish{ reflection 1 }} }

plane { <0,0,-1>, 0
  pigment {
    checker color White, color Gray
  }
}