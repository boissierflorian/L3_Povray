// inclusion des couleurs prédéfinies
#include "colors.inc"

// définition de la couleur de fond
background { color Cyan }

// positionnement de la caméra
camera {
  location <0, 2, -3>
  look_at <0, 1, 2>
}

// définition d'une source
light_source {
  <2, 4, -3>
   color White
}

// définition d'une sphère
sphere {
   <0, 1, 2>, 2
   texture {
     pigment { color Yellow }
   }
}