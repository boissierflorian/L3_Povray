// ------------------------------------------
// POV-Ray 3.7 Fichier de scène "Sphere2.pov"
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
  location <0, 1, -6>
  look_at <0, 0, 0>
  rotate <0, 90, 0>
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
  texture { pigment { color Bronze} }
  scale <0.7, 1.1, 1>
  finish {
    phong 0.5
    diffuse 0.7
  }
};

//-------------------------------------------
// Macros (Coordonnées sphériques)
//-------------------------------------------
#macro Sphx(Rayon, Theta, Phi)
  Rayon * cos(radians(Theta)) * cos(radians(Phi))
#end

#macro Sphy(Rayon, Phi)
  Rayon * sin(radians(Phi))
#end

#macro Sphz(Rayon, Theta, Phi)
  Rayon * sin(radians(Theta)) * cos(radians(Phi))
#end

// générateur aléatoire
#declare maSerie=seed(1234);

// retourne un nombre compris entre 0 et N
#macro Rnd(N)
  int(rand(maSerie)) * N
#end

// Objet final
difference {
  object { Oeuf }
  
  // Génération aléatoire des sphères
  #declare I=0;
  #while (I < 100)  
    // Génération des données
    #declare Rayon = rand(maSerie) * 2;
    #declare Theta = rand(maSerie) * 180;
    #declare Phi   = rand(maSerie) * 360;
    
    sphere {
      <Sphx(Rayon, Theta, Phi), Sphy(Rayon, Phi), Sphz(Rayon, Theta, Phi)>, 
      rand(maSerie) - 0.5
      pigment {color Bronze}
    } // fin sphere
  
    #declare I=I+1;
  #end // fin while
} // fin différence