// inclusion des couleurs prédéfinies
#include "colors.inc"

// positionnement de la caméra
camera {
  location <-400, 10, -800>
  look_at <0, 0, 0>
}

// définition d'une source
light_source { 
  <1, 200, 0>
   color White
}

//définition d'un champ de montagnes
height_field {
  jpeg "../sujet/Images/HF01.jpg"
  water_level 0.5
  pigment {LightWood}
  scale <1000, 300, 1000>
  translate <-500, -300, -500>
}

// définition d'un plan
plane {
  <0, 1, 0>, 0
  pigment { Blue }
  translate <0, -150, 0>
}