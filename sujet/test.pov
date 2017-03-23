// inclusion des couleurs pr�d�finies
#include "colors.inc"

// d�finition de la couleur de fond
background { color Cyan }

// positionnement de la cam�ra
camera {
  location <0, 2, -3>
  look_at <0, 1, 2>
}

// d�finition d'une source
light_source {
  <2, 4, -3>
   color White
}

// d�finition d'une sph�re
sphere {
   <0, 1, 2>, 2
   texture {
     pigment { color Yellow }
   }
}