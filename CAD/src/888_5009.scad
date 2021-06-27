include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./lib/ALU_profile.scad>
use <./lib/rotor_joint.scad>
use <./888_5002.scad>
use <./888_5005.scad>
use <./888_5011.scad>


module 888_5009_attachment_points() {
    // tower arms /////////////////////////////////////////////////////////
    translate([0, base_width/2-ALU_profile_width, 0])
    rotate([tower_angle, 0 ,0])
    translate([0, ALU_profile_width/2 ,0])
    ALU_profile(height=tower_arm_length);
    
    translate([0, -base_width/2+ALU_profile_width, 0])
    rotate([-tower_angle, 0 ,0])
    translate([0, -ALU_profile_width/2 ,0])
    ALU_profile(height=tower_arm_length);
}

module 888_5009(print_plate=false) {
    union() {
        difference() {
            hull() {
                translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2, -base_width/2+ALU_profile_width, 0])
                rotate([-tower_angle, 0 ,0])
                translate([0, -ALU_profile_width*0.5-ALU_profile_width/2-ALU_profile_holder_wall_thickness ,tower_arm_length-ALU_profile_width*1.5-0.01])
                cube([ALU_profile_holder_wall_thickness*2, ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width*1.5+ALU_profile_holder_wall_thickness*3]);
                
                
                translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2, base_width/2-ALU_profile_width, 0])
                rotate([tower_angle, 0 ,0])
                translate([0, -ALU_profile_width*0.5+ALU_profile_width/2-ALU_profile_holder_wall_thickness ,tower_arm_length-ALU_profile_width*1.5-0.01])
                cube([ALU_profile_holder_wall_thickness*2, ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width*1.5+ALU_profile_holder_wall_thickness*3]);
            }
            
            
            // top screw
            translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*3, 0, tower_height+15])
            rotate([0, 90, 0])
            union() {
                cylinder(h = ALU_profile_holder_wall_thickness*4, d=M6_screw_diameter, $fn=50);
                
                translate([0, 0, 2.99])
                cylinder(h = 4, d=15, $fn=50);
            }
            
            
            // bottom screw
            translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*3, 0, tower_height-35])
            rotate([0, 90, 0])
            union() {
                cylinder(h = ALU_profile_holder_wall_thickness*4, d=M6_screw_diameter, $fn=50);
                
                translate([0, 0, 2.99])
                cylinder(h = 4, d=15, $fn=50);
            }
            
            
            // profile screws
            translate([0, ALU_profile_width-ALU_profile_holder_wall_thickness, tower_height])
            rotate([tower_angle, 0, 0])
            translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*3, 0, -20])
            rotate([0, 90, 0])
            union() {
                cylinder(h = ALU_profile_holder_wall_thickness*4, d=M6_screw_diameter, $fn=50);
                
                translate([0, 0, 2.99])
                cylinder(h = 4, d=15, $fn=50);
            }
            
            translate([0, -ALU_profile_width+ALU_profile_holder_wall_thickness, tower_height])
            rotate([-tower_angle, 0, 0])
            translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*3, 0, -20])
            rotate([0, 90, 0])
            union() {
                cylinder(h = ALU_profile_holder_wall_thickness*4, d=M6_screw_diameter, $fn=50);
                
                translate([0, 0, 2.99])
                cylinder(h = 4, d=15, $fn=50);
            }
        }
        
        // tower bridge attachment point
        translate([(-608_bearing_outer_diameter-10-ALU_profile_width)/2-ALU_profile_holder_wall_thickness-15, -26/2, tower_height-12])
        rotate([0, 90, 90])
        union() {
            difference() {
                hull() {
                    translate([-608_bearing_outer_diameter/2-10/2, -(608_bearing_outer_diameter+10)/2-15, 0])
                    cube([608_bearing_outer_diameter+10, 3, 26]);
                    cylinder(h=26, d=608_bearing_outer_diameter+10, $fn=100);
                }
                translate([0, 0, -5])
                cylinder(h=26+10, d=M6_screw_diameter+10, $fn=100);
                
                translate([0, 0, -.01])
                cylinder(h=608_bearing_thickness, d=608_bearing_outer_diameter, $fn=100);
                
                translate([0, 0, 26-608_bearing_thickness+.01])
                cylinder(h=608_bearing_thickness, d=608_bearing_outer_diameter, $fn=100);
            }
        
            if(!print_plate) {
                translate([0, 0, 608_bearing_thickness])
                888_5011();
            }
        }
    }
}

888_5009();
#888_5009_attachment_points();
