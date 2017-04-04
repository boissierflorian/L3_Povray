// inclusion des couleurs prédéfinies
#include "colors.inc"

// positionnement de la caméra
camera {
  location <0, 30, -100>
  look_at <0, 0, 0>
}

// définition d'une source
light_source { 
  <0, 20, -40>
   color White
}

// définition d'un plan
#declare sol = plane {
  <0, 1, 0> 0
  pigment {Grey}
};

sol

// un modèle simple de sapin
// centré sur l'axe 0y - dans <-0.3, 0.0, -0.3> - <-0.3, 0.5, -0.3>
#declare sapin = union {
  cylinder { <0,0,0>,<0,0.25,0>, 0.1 pigment {color Brown} }
  cone { <0,0.25,0>,0.3,<0,0.35,0>, 0.0 pigment {color Green} }
  cone { <0,0.30,0>,0.3,<0,0.40,0>, 0.0 pigment {color Green} }
  cone { <0,0.35,0>,0.3,<0,0.45,0>, 0.0 pigment {color Green} }
  cone { <0,0.40,0>,0.3,<0,0.50,0>, 0.0 pigment {color Green} }
};

// place les sapins dans l'intervalle [-450, 450]
// par l'intermédiaire de trace
#declare I = 450;

#while (I < 450)
  
  #declare J=450;
  
  #while (J < 450)
    #declare Point_Depart = <I, 0, J>;
    #declare Orientation = <0, -1, 0>;
    #declare UnSapin = object { sapin scale <5, 10, 5> };
  
    #declare Hit = trace(sol, Point_depart, Orientation);
    
    
  
  #declare J=J+10;
  #end
#declare I=I+10;
#end
