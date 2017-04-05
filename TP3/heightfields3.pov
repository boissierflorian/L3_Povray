// inclusion des couleurs prédéfinies
#include "colors.inc"

// positionnement de la caméra
camera {
  location <500, 400, -700>
  // pointe vers le centre de la chaîne de montagnes
  look_at <500, 150, 500> 
}

// définition d'une source
light_source { 
  <1, 200, 0>
   color White
}

// déclaration d'un champ de montagnes
#declare hf = height_field {
  jpeg "../sujet/Images/HF01.jpg"
  smooth
  scale <1000, 300, 1000>
};

union {
  height_field {
    jpeg "../sujet/Images/HF01.jpg"
    smooth 
    water_level 0.5
    scale <1000, 300, 1000>
    pigment {White}
  }
  
  intersection {
    object { hf }
    box {
      <0, 0, 0>, <1000, 150, 1000>
    }
    pigment {LightWood}
  }
  
  intersection {
    object {hf inverse}
    box {
      <0, 0, 0>, <1000, 110, 1000>
      pigment {Green}
    }
  }
  
  intersection {
    object {hf inverse}
    box {
      <0, 0, 0>, <1000, 110, 1000>
      pigment {Red}
    }
  }
}


