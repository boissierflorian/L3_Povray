#include "colors.inc"


background { color Black }

camera{
	location <0,800,-1000>
	look_at <0,-200,1000>
}

light_source{
	<500,1000,-500>
	color White
}

#declare HF = height_field {
 jpeg "../sujet/Images/HF01.jpg"
 smooth
 scale <1000, 300, 1000>
 translate <-500, 0, -500>
 rotate <0, 180, 0>
};

intersection {
  object {HF}
  box { <-600, 150, 0>, <600, 450, 600> }
  texture { pigment { color White } }
} 

intersection {
  object {HF}
  box { <-600, 100, 0>, <600, 150, 600> }
  texture { pigment { color LightWood} }
}

intersection {
  object {HF}
  box { <-600, 50, 0>, <600, 100, 600> }
  texture { pigment { color Green } }
}

intersection {
  object {HF}
  box { <-600, 0, 0>, <600, 50, 600> }
  texture { pigment { color ForestGreen } }
}
