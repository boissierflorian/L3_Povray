// inclusion des couleurs prédéfinies
#include "colors.inc"

// définition de la couleur de fond
background { color SummerSky }

// positionnement de la caméra
camera {
  location <0, 3, -4>
  look_at <0, 1, 2>
}

// définition d'une source
light_source { 
  <15, 25, 1>
   color White
}

// Texture de la table (pied + plateau)
#declare MaTexture = texture { 
  pigment { color Red }
  finish {
    reflection { 0.5 }
  }
}

// définition du pied de table
box {
  <-1, 0, 0>, <1, 0.5, 1>
  texture { MaTexture }
}

// définition du plateau de table
box {
  <-2, 0.8, -0.8>, <2, 0.85, 4>
  texture { MaTexture }
}

// définition d'une sphère
// En réglant ambient et diffuse sur 0
// La sphère devient complètement noire car
// (ambient) le niveau d'éclairage minimum est égal à 0
// et la lumière renvoyée vers la caméra (diffuse) l'est
// aussi.
sphere {
   <0, 1.6, 2>, 0.75
  texture {
    pigment { color White }
      finish {
        specular 1
        metallic
        reflection { .75 metallic }
      }
   }
}

// définition du sol
plane {
  <0, 1, 0>, 0
  texture { pigment { checker Green, White } }
}