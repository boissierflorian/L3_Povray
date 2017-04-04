// inclusion des couleurs prédéfinies
#include "colors.inc"

// définition de la couleur de fond
background { color White }

// positionnement de la caméra
camera {
  location <1, 10, -10>
  look_at <0, 0, 0>
}

// définition d'une source
light_source { 
  <3, 10, -10>
   color White
}

// définition de la macro
#macro rondelle(diam_ext, diam_int, epaisseur)
  lathe {
    linear_spline
    4,
    <diam_int, 0>, <diam_ext, 0>, <diam_ext, epaisseur>, 
    <diam_int, epaisseur>
  }
#end

// code initial
object {
  rondelle(2, 1.5, 1.0)    
  pigment {Red}
}

object {
  rondelle(3, 2, 0.2)
  pigment {Green}
  translate <-2, 3, 0>
  rotate <0,0,40>
}