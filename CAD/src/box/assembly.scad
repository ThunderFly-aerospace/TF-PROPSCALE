$fn=40; // model faces resolution.
use <src/UNIBOX03A_D01.scad>
use <src/otvory.scad>

include <configuration.scad>
include <src/otvory_conf.scad>


barva_sloupku = "cyan";
barva_listy = "red";
barva_celicka = "green";
barva_plbase = "yellow";

//Předni čeličko
//------------------------------------------------------------

vzdalenost_AL=9; //vzdalenost od hrany čelíčka k vrchní hraně ALbase 9

difference() {
color(barva_sloupku)
translate([0,0,0])
UNIBOX03A_D01();



posun_modulu_der_x=-6;
#rotate(a=[-90,0,0])
translate([posun_modulu_der_x*roztec_der-roztec_der*(pocet_der_osa_x-1)/2,0,-rozmer_y/2+vzdalenost_AL])
C1(sila*2,rozmer_y-vzdalenost_AL);
    
    
posun_modulu_der_x2=9;
rotate(a=[-90,0,0])
translate([posun_modulu_der_x2*roztec_der-roztec_der*(pocet_der_osa_x-1)/2,0,-rozmer_y/2+vzdalenost_AL])
USBI2C01A(2*sila,roztec_der,vzdalenost_AL);
  
posun_modulu_der_x3=12;
rotate(a=[-90,0,0])
translate([posun_modulu_der_x3*roztec_der-roztec_der*(pocet_der_osa_x-1)/2,0,-rozmer_y/2+vzdalenost_AL])
USBI2C01A(2*sila,roztec_der,vzdalenost_AL);
  
  
    
     }  

translate([15, 10, 0]) linear_extrude(sila+0.5) text("ThunderFly", size=8);
translate([-56, -15, 0]) linear_extrude(sila+0.5) text("TF-MOTORSCALE", size=5);
     
    
