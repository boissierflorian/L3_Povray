// inclusion des couleurs prédéfinies
#include "colors.inc"

// définition de la couleur de fond
background { color Cyan }

// positionnement de la caméra
camera {
  location <10, 10, -15>
  look_at <11, 10, 15>
}

// définition d'une source
light_source { 
  <-2, 4, -3>
   color White
}

// définition d'un plan sur l'axe 0xy
plane {
 <0, 0, 1> 0
 pigment { color Red }
 translate <0, 0, 10>
}

// définition des sphères
#declare I=0;
#while (I < 9)
  #declare J=0;
  #while (J < 9)
    sphere { <I * 2.5, J * 2.5, 9>, 1 pigment { Yellow } }
  #declare J=J+1;  
  #end
#declare I=I+1;
#end