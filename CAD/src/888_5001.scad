include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>
use <./lib/ALU_profile_holder_side.scad>


module 888_5001(rotated=true) {
    difference() {
        union() {
            translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
            if (rotated) {
                ALU_profile_holder_top(ALU_profile_width);
            } else {
                ALU_profile_holder_side(ALU_profile_width);
            }
            
            hull() {
                translate([ALU_profile_width/2-strain_gauge_width/2+ALU_profile_holder_wall_thickness, 0, 0])
                cube([strain_gauge_width, 5, 20]);
                
                translate([0, -5, 0])
                cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, 5, ALU_profile_width]);
            }
        }
        
        
        translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, -.02, 5])
        rotate([-90, 0, 0])
        union() {
            cylinder(h=20, d=M5_screw_diameter, $fn=20);
            
            translate([0, 0, -ALU_profile_holder_wall_thickness*2+.01])
            cylinder(h=M5_head_height+1, d=8, $fn=20);
        }
        
        translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, -.02, 5+strain_gauge_screw_distance])
        rotate([-90, 0, 0])
        union() {
            cylinder(h=20, d=M5_screw_diameter, $fn=20);
            
            translate([0, 0, -ALU_profile_holder_wall_thickness*2+.01])
            cylinder(h=M5_head_height+1, d=8, $fn=20);
        }
    }
}

888_5001();
