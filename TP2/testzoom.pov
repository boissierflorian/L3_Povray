#include "colors.inc"

// définition de la couleur de fond
background { color Cyan }

// positionnement de la caméra
camera {
  location <0, 0, -10 + clock * 8>
  look_at <0, 0, 0>
}

// définition d'une source
light_source {
  <2, 4, -3>
  color White
}

// définition d'une sphère
sphere {
  <0, 0, 0>, 1
  texture {
    pigment { Red }
  }
}