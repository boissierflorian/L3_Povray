// ------------------------------------------
// POV-Ray 3.7 Fichier de scène "Sphere1.pov"
// Par Boissier Florian, Avril-2017
//-------------------------------------------

//-------------------------------------------
// Inclusions
//-------------------------------------------
#include "colors.inc"

//-------------------------------------------
// Camera
//-------------------------------------------
camera {
  location <0, 2, -6>
  look_at <0, 0, 0>
}

//-------------------------------------------
// Soleil
//-------------------------------------------
light_source { 
  <-8, 10, -20>
   color White
}

//-------------------------------------------
// Sol
//-------------------------------------------
plane {
  <0, 1, 0>, 0
  pigment {Grey}
}
//-------------------------------------------
// Objets
//-------------------------------------------
// définition de la sphère
#declare Oeuf = sphere {
  <0, 1.25, 0>, 1.25
  texture { pigment {color Bronze} }
  //scale <Cos_r(R, THETA), 1, Sin_r(R, THETA)>
  scale <0.7, 1.1, 1>
  finish {
    phong 0.5
    diffuse 0.7
  }
};

// objet final
difference { 
  object { Oeuf }
  
  #declare I=0;
  #declare NbSpheres=30;
  #while (I < NbSpheres)
    #declare Depart = <0.7, 1.3, 0>;
    #declare Pos = vrotate(Depart, <0, I * 360 / NbSpheres, 0>);
    #declare Inter = trace(Oeuf, Pos, <0, 0, -Pos.z>);
      
    sphere {
      Inter, 0.05
      pigment { color Bronze }
    }
  #declare I=I+1;
  #end
}