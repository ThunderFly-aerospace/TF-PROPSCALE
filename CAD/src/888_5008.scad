include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./lib/ALU_profile.scad>
use <./888_5002.scad>
use <./888_5005.scad>
use <./888_5011.scad>


module 888_5008_attachment_points() {
    // tower arms /////////////////////////////////////////////////////////
    translate([0, base_width/2-ALU_profile_width, 0])
    rotate([tower_angle, 0 ,0])
    translate([0, ALU_profile_width/2 ,0])
    ALU_profile(height=tower_arm_length);
    
    translate([0, -base_width/2+ALU_profile_width, 0])
    rotate([-tower_angle, 0 ,0])
    translate([0, -ALU_profile_width/2 ,0])
    ALU_profile(height=tower_arm_length);
    
    // drag attachment point
    translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2+strain_gauge_width+4, 0, tower_height-strain_gauge_length/2-tower_drag_z_offset/2+2])
    rotate([0, -90, 0])
    translate([-strain_gauge_length/2, -strain_gauge_width/2, 0])
    color([0, 0, 1])
    cube([strain_gauge_length, strain_gauge_width, strain_gauge_width]);
}

module 888_5008(print_plate=false) {
    union() {
        difference() {
            hull() {
                translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2, -base_width/2+ALU_profile_width, 0])
                rotate([-tower_angle, 0 ,0])
                translate([0, -ALU_profile_width*0.5-ALU_profile_width/2-ALU_profile_holder_wall_thickness ,tower_arm_length-ALU_profile_width*1.5-0.01])
                cube([ALU_profile_width+ALU_profile_holder_wall_thickness*4, ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width*1.5+ALU_profile_holder_wall_thickness*3]);
                
                
                translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2, base_width/2-ALU_profile_width, 0])
                rotate([tower_angle, 0 ,0])
                translate([0, -ALU_profile_width*0.5+ALU_profile_width/2-ALU_profile_holder_wall_thickness ,tower_arm_length-ALU_profile_width*1.5-0.01])
                cube([ALU_profile_width+ALU_profile_holder_wall_thickness*4, ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width*1.5+ALU_profile_holder_wall_thickness*3]);
            }
            
            // profile arm cutter
            translate([-ALU_profile_width/2, -base_width/2+ALU_profile_width, 0])
            rotate([-tower_angle, 0 ,0])
            translate([0, -ALU_profile_width/2-ALU_profile_width/2 ,0])
            cube([ALU_profile_width, ALU_profile_width, tower_arm_length]);
            
            translate([-ALU_profile_width/2, base_width/2-ALU_profile_width, 0])
            rotate([tower_angle, 0 ,0])
            translate([0, -ALU_profile_width/2+ALU_profile_width/2 ,0])
            cube([ALU_profile_width, ALU_profile_width, tower_arm_length]);
            
            // bottom profile screws holes
            hull() {
                translate([0, -base_width/2+ALU_profile_width, 0])
                rotate([-tower_angle, 0 ,0])
                translate([0, ALU_profile_width+ALU_profile_holder_wall_thickness, tower_arm_length-ALU_profile_width])
                rotate([90, 0, 0])
                cylinder(h=ALU_profile_width, d=M6_nut_diameter+5, $fn=50);
                
                translate([0, base_width/2-ALU_profile_width, 0])
                rotate([tower_angle, 0 ,0])
                translate([0, -ALU_profile_holder_wall_thickness, tower_arm_length-ALU_profile_width])
                rotate([90, 0, 0])
                cylinder(h=ALU_profile_width, d=M6_nut_diameter+5, $fn=50);
            }
            
            // profile screws main holes
            translate([0, -base_width/2+ALU_profile_width, 0])
            rotate([-tower_angle, 0 ,0])
            translate([0, ALU_profile_width*2, tower_arm_length-ALU_profile_width])
            rotate([90, 0, 0])
            cylinder(h=ALU_profile_width*4, d=M6_screw_diameter, $fn=50);
            
            translate([0, base_width/2-ALU_profile_width, 0])
            rotate([tower_angle, 0 ,0])
            translate([0, ALU_profile_width*2, tower_arm_length-ALU_profile_width])
            rotate([90, 0, 0])
            cylinder(h=ALU_profile_width*4, d=M6_screw_diameter, $fn=50);
            
            translate([0, -base_width/2+ALU_profile_width, 0])
            rotate([-tower_angle, 0 ,0])
            translate([0, -ALU_profile_width/2, tower_arm_length-12])
            rotate([90, 0, 0])
            cylinder(h=ALU_profile_width, d=M6_screw_diameter, $fn=50);
            
            translate([0, base_width/2-ALU_profile_width, 0])
            rotate([tower_angle, 0 ,0])
            translate([0, ALU_profile_width*1.5, tower_arm_length-12])
            rotate([90, 0, 0])
            cylinder(h=ALU_profile_width, d=M6_screw_diameter, $fn=50);
            
            // drag tenzometer attachment point
            translate([0, 0, tower_height-tower_drag_z_offset+strain_gauge_screw_distance/2])
            rotate([90, 0, -90])
            cylinder(h=ALU_profile_width, d=M4_screw_diameter, $fn=50);
            
            translate([0, 0, tower_height-tower_drag_z_offset-strain_gauge_screw_distance/2])
            rotate([90, 0, -90])
            cylinder(h=ALU_profile_width, d=M4_screw_diameter, $fn=50);
            
            translate([-ALU_profile_width/2-ALU_profile_holder_wall_thickness*2+strain_gauge_width+4+2, 0, tower_height-strain_gauge_length/2-tower_drag_z_offset/2+2])
            rotate([0, -90, 0])
            translate([-strain_gauge_length/2, -strain_gauge_width/2-2, 0])
            cube([strain_gauge_length, strain_gauge_width+4, strain_gauge_width+2]);
        }
        
        // tower bridge attachment point
        translate([(608_bearing_outer_diameter+10-ALU_profile_width-ALU_profile_holder_wall_thickness*4)/2, 26/2, tower_height+53])
        rotate([90, 0, 0])
        union() {
            difference() {
                hull() {
                    translate([-608_bearing_outer_diameter/2-10/2, -(608_bearing_outer_diameter+10)/2-15, 0])
                    cube([ALU_profile_width+ALU_profile_holder_wall_thickness*4, 3, 26]);
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

888_5008();
#888_5008_attachment_points();
