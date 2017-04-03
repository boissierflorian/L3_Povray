// inclusion des couleurs prédéfinies
#include "colors.inc"
// inclusion de textures
#include "stones.inc"

// définition de la couleur de fond
background { color Cyan }

// positionnement de la caméra
camera {
  location <0, 8, -10>
  look_at <0, 0, 0>
  rotate <0, 360 * clock, 0>
}

// définition d'une source
light_source { 
  <-2, 14, -10>
   color White
}

difference {
 // définition d'un cône creux
 cone {
  <0, 0, 0>,
  1.5,
  <0, 1.75, 0>,
  2
  //open
  texture { pigment { color Orange } }
 }
  
 cone {
   <0, 0, 0>,
   1.4,
   <0, 1.75, 0>,
   1.95
   open
   texture { pigment { color Silver } }
 }
}

// définition du fond du cône (cylindre)
cylinder {
  <0, 0, 0>,
  <0, 0.05, 0>,
  1.4
  texture { pigment { color Silver } }
}

// ajout du sol
plane {
  <0, 1, 0>, 0
  texture { T_Stone1 }
}

// définition du cylindre
cylinder {
  <0, 0, 0>,
  <0, 3, 0>,
  0.15
  texture { pigment { color Red } }
  rotate <40, 50, 0>
  translate <0, 0.75, -0.2>
}
