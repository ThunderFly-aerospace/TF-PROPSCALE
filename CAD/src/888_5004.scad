include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>


module 888_5004() {
    union() {
        translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
        ALU_profile_holder_side(608_bearing_outer_diameter+10);
        
        translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, -1, 0])
        rotate([-90, 0, 0])
        difference() {
            hull() {
                translate([0, -(608_bearing_outer_diameter+10)/2, -2])
                cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, 608_bearing_outer_diameter+10, 4], center=true);
        
                translate([0, -(608_bearing_outer_diameter+10)/2, 608_bearing_outer_diameter])
                rotate([0, 90, 0])
                cylinder(d=608_bearing_outer_diameter+10, h=45+5, center=true, $fn=50);
            }
        
            translate([-25-.1, -(608_bearing_outer_diameter+10)/2, 608_bearing_outer_diameter])
            rotate([0, 90, 0])
            union() {
                cylinder(d=M8_screw_diameter, h=45+11, $fn=50);
                cylinder(d=8, h=M8_head_height+10, $fn=50);
                
                translate([0, 0, 45+.1])
                cylinder(d=M6_nut_diameter, h=20, $fn=6);
            }
        
            translate([0, -608_bearing_outer_diameter, 608_bearing_outer_diameter])
            cube([26+0.5, 608_bearing_outer_diameter*2, 608_bearing_outer_diameter*2], center=true);
        }
    }
}

888_5004();

translate([-(-ALU_profile_width-ALU_profile_holder_wall_thickness*2+45+5)/2, 608_bearing_outer_diameter-1, (608_bearing_outer_diameter+10)/2])
rotate([0, 90, 0])
#cylinder(h=45, d=8);
