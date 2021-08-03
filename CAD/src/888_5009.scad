include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>
use <./lib/rotor_joint.scad>


module 888_5009() {
    difference() {
        union() {
            translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
            ALU_profile_holder_top(ALU_profile_width);
            
            translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, 5-.01, ALU_profile_width+0.64])
            rotate([90, 0, 0])
            rotor_joint(1);
        }
    }
}

888_5009();
