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

// définition d'une sphère jaune
sphere {
 <0, 1, 12>, 2
 texture { pigment { color Yellow } }
}

// définition d'une sphère verte
sphere {
  <1, 1, 9>, 1
  texture { pigment { color Green } }
}

// ajout d'une source de lumière ponctuelle
// symétrique à la première par rapport au 
// plan d'équation x = 0
light_source {
  <-2, 4, 3>
  color White
}

// Plan infini sur l'axe Oxy
// Placé derrière la sphère jaune !
plane {
 <0,0,1>, 0
 texture { pigment { color Blue } }
 translate <0, 0, 15>
}