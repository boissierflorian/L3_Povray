// inclusion des couleurs prédéfinies
#include "colors.inc"

// le générateur de nombre aléatoire
#declare maSerie = seed(1237);

// retourne un entier aléatoire compris entre 0 et MAX
#macro alea(Max)
  int(rand(maSerie) * Max)
#end

// définition de la couleur de fond
background { color Cyan }

// positionnement de la caméra
camera {
  location <4.5, 4.5, -6>
  look_at <4.5, 4.5, 3>
}

// définition d'une source
light_source { 
  <2, 4, -3>
   color White
}

#declare I = 0;

#while (I < 20)
  #declare X = alea(9);
  #declare Y = alea(9);
  #declare Z = alea(9);
  #declare diametre = rand(maSerie);
  #declare R = rand(maSerie);
  #declare G = rand(maSerie);
  #declare B = rand(maSerie);
  #declare TYPE = rand(maSerie);
  
  #switch (TYPE)
    #range (0, 0.33)
      sphere {<X, Y, Z>, diametre
        texture { 
          pigment { color rgb<R, G, B> } 
        } 
      }
    #break
    
    #range (0.33, 0.66)
      sphere {<X, Y, Z>, diametre
        texture { 
          pigment { color rgb<R, G, B> } 
        }
	scale<rand(maSerie) * alea(10), rand(maSerie) * alea(10), 
	      rand(maSerie) * alea(10)>
      }
    #break  
    
    #else
      box {
        <X, Y, Z>, <X + diametre, Y + diametre, Z + diametre>
        texture {
	  pigment { color rgb<R, G, B> }
        }
      }
  #end
 
#declare I=I+1;
#end