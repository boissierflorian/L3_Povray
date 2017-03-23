// POUR LE GENERATEUR DE POINTS
// CHOISIR LE TYPE DE SPLINE
//
// LINEAR  = 1;
// QUADRIC = 2;
// CUBIC   = 3;  
// BEZIER  = 4;
// 
// On peut Changez les points de controls 
// pour comprendre
//-------------------------------------------------
  #declare SPLINE= 2;// CHOISIR LE TYPE DE SPLINE
//=================================================
// initialisation du Type de Spline. laisser ainsi!
//-------------------------------------------------
  #declare LINEAR  = 1;
  #declare QUADRIC = 2;
  #declare CUBIC   = 3;  
  #declare BEZIER  = 4;
//-------------------------------------------------
///////  POSITION DES POINTS DE CONTROL /////////
//-------------------------------------------------
// ici changez les coordonnées des x,y et laissez z à zéro 
//-------------------------------------------------
#switch (SPLINE)
//SPLINE01 LINEAR
#case (1)
  #declare  Tab_Points  =
            array[6] { 
                      <1.20, 4.00>,<0.80, 3.00>,
                      <1.90, 2.50>,<2.20, 1.50>,
                      <1.50, 0.50>,<0.50, 0.00>
                      }
  #declare SPLINE = LINEAR;
#break

//SPLINE02 QUADRIC
#case (2)
  #declare  Tab_Points   =array[6]{ <3.50, 4.00>,<0.80, 3.80>,<0.90, 2.50>,<2.20, 1.50>,<1.50, 0.50>,<0.00, 0.00>}
  #declare SPLINE = QUADRIC;
#break

//SPLINE03 CUBIC
#case (3)  
  #declare  Tab_Points   =array[6]{ <3.50, 3.00>,<0.80, 3.80>,<0.50, 3.00>,<1.30, 1.50>,<0.90, 0.00>,<4.00, 1.00>}
  #declare SPLINE= CUBIC;
#break

//SPLINE04 BEZIER
#case(4)
  #declare  Tab_Points   = array[4]{  <0.6,4.0>,<1.0,3.0>,<3.0,1.0>,<0.5,0.0> }
                          //array[8]{  <0.6, 4.0>,<1.00, 3.50>,<2.00, 3.00>,<3, 2.00>,<3,2>,<1,1.2>,<.6,1>,<1,0> }
  #declare SPLINE= BEZIER;
#end//switch


//===================================================================
//////// LAISSER AINSI CI-DESSOUS  //////////////////////////////////
//===================================================================
   #include "colors.inc"
   #default{ finish { ambient .3 diffuse .6 phong 1}}
//===================================================================
   #declare nbr_Pt= dimension_size(Tab_Points,1);    

//===================================================================
//  Couleurs des Points de control utilisé  
//===================================================================
#declare Tab_Color = array[20]{Red,Green,Blue,Yellow,Cyan,Magenta,Black,Aquamarine,BlueViolet,
                   Brown,CadetBlue,Coral,CornflowerBlue,DarkGreen,DarkOliveGreen,
                   DarkOrchid,DarkSlateBlue,DarkSlateGray,DarkTurquoise,MediumForestGreen}

//===================================================================
////// on fait le Lathe en montrant les points de control ///////////
//===================================================================
lathe
 {
 #switch (SPLINE)  //choix du type de courbe
 #case (1) linear_spline #break
 #case (2) quadratic_spline #break
 #case (3) cubic_spline #break
 #case (4) bezier_spline 
 #end
 nbr_Pt
      #declare Boucle=0;
      #while (Boucle < nbr_Pt)
       ,
       Tab_Points[Boucle]  //placement des points de contrôle
      #declare Boucle=Boucle+1;
      #end
      sturm on
      pigment {Coral transmit .3} 
      finish {phong .9}
 }
  // On rend les points visible //
union { 
#declare Boucle=0;
      #while (Boucle < nbr_Pt)
            sphere {<1,1,0>*Tab_Points[Boucle],.12 pigment {Tab_Color[Boucle]} finish {ambient 1 diffuse 0}}
            #declare Boucle=Boucle+1;
      #end   
no_shadow
}
//- Montrez les Tangente si courbe de Bézier
#if (SPLINE = 4)
union { 
#declare Boucle=0;
#while (Boucle < nbr_Pt)
  cylinder {<1,1,0>*Tab_Points[Boucle],<1,1,0>*Tab_Points[Boucle+1],.05    pigment {Tab_Color[Boucle]}   finish {ambient 1 diffuse 0}}
  cylinder {<1,1,0>*Tab_Points[Boucle+3],<1,1,0>*Tab_Points[Boucle+2],.05  pigment {Tab_Color[Boucle+3]} finish {ambient 1 diffuse 0}}
#declare Boucle=Boucle+4;
#end   
}
#end

//== AXE ============================================================
  cylinder {<0,-20,0><0,20,0>.05 pigment{Black}}  
//==== Affiche le type de spline tracé Et position des points =======
   #declare Spl=array[4]{"Linear","Quadratic","Cubic","Bezier"}
   #declare Tab=array[nbr_Pt] 
   #declare Texte_Spline=concat( " Type : ", Spl[SPLINE-1] , " ",str(nbr_Pt,1,0)," points") 
   #debug concat ("\nSpline", Texte_Spline) 
   #declare Boucle = 0; 
   #while ( Boucle < nbr_Pt)
         #declare  Tab[Boucle] = Tab_Points[Boucle];
         #declare Texte_Point_Spline=concat( "point ", str(Boucle+1,1,0), " : < ", str(Tab[Boucle].x,1,1)," , ", str(Tab[Boucle].y,1,1),">")
         text {ttf "arial.ttf" Texte_Point_Spline 0,0
            pigment {Tab_Color[Boucle]} 
            scale 0.2 
            translate <4,3.1-Boucle/3.3,-3>
            no_shadow
            }
         #declare Boucle = Boucle + 1;
   #end 
  text {ttf "arial.ttf" Texte_Spline 0,0
      pigment {Red} 
      scale 0.3 
      translate <1.9,4.2,-3>
      no_shadow
  }
//===================================================================
//Grille
#declare Boucle=-2;
union {
#while (Boucle<5)
 cylinder { x*-5,x*4.5,.01  translate y*Boucle}
 cylinder {y*-5,y*4.5,.01  translate x*Boucle}
 #declare Boucle=Boucle+1;
#end 
pigment {Black}
}
//===================================================================
  camera {
          orthographic
          up <0,5,0>
          right <5*1.33, 0, 0>
          location <2.5, 2.5,-20>
          look_at <2.5, 2.0, 0>
      }
light_source {<20,20,-30> rgb 1}      
background {rgb 1}
//===================================================================
///////-FIN DE FICHIER-/////////////////////////////////////////////
//===================================================================
