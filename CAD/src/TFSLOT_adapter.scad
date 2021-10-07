include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./888_5002.scad>


module TFSLOT_mount() {
    
    difference(){
        union(){
            // pripevneni k ramu vahy
            translate([-ALU_profile_width/2 - ALU_profile_holder_wall_thickness, 0, 0]) union() {
                translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
                ALU_profile_holder_side(ALU_profile_width);
            }
            
            translate([0, 15, ALU_profile_width/2])
                cube([ALU_profile_width/3*2, 30, ALU_profile_width], center=true);
        }
        
        translate([0, 0, ALU_profile_width/2]) rotate([-90, 0, 0]) cylinder(d=10.3, h=50);
    }
}


TFSLOT_mount();


