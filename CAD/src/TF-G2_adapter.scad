include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./888_5002.scad>


module 888_5003_A() {
    union() {
        translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
        ALU_profile_holder_side(ALU_profile_width);
    }
}

#888_5003_A();
