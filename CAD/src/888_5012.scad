include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./lib/ALU_profile.scad>
use <./888_5005.scad>
use <./888_5007.scad>
use <./888_5008.scad>
use <./888_5009.scad>


module 888_5012_attachment_points() {
    translate([(front_tower_offset-back_tower_offset)/2, 0, -tower_height+12])
    888_5007(false);
    
    translate([-(front_tower_offset-back_tower_offset)/2, 0, -tower_height+12])
    888_5008(false);
    
    translate([(front_tower_offset-back_tower_offset)/2, 0, -tower_height+12])
    888_5009(false);
    
    
    translate([-35, 0, 0])
    rotate([0, 90, 0])
    ALU_profile(height=70);
}

module 888_5012() {
    union() {
        difference() {
            //union () {
                hull() {
                    translate([35+14+608_bearing_outer_diameter/2, ALU_profile_holder_wall_thickness+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
                    rotate([90, 0, 0])
                    cylinder(d=ALU_profile_width, h=ALU_profile_holder_wall_thickness*2, $fn=50);
                    
                    translate([-35-14-608_bearing_outer_diameter/2, ALU_profile_holder_wall_thickness+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
                    rotate([90, 0, 0])
                    cylinder(d=ALU_profile_width, h=ALU_profile_holder_wall_thickness*2, $fn=50);
                
                
                translate([-35-14-608_bearing_outer_diameter/2, ALU_profile_holder_wall_thickness*5+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
                rotate([90, 0, 0])
                cylinder(d=608_bearing_outer_diameter, h=ALU_profile_holder_wall_thickness*5, $fn=50);
            }
            
            
            // axle holes
            translate([35+14+608_bearing_outer_diameter/2, ALU_profile_holder_wall_thickness*6+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
            rotate([90, 0, 0])
            union() {
                cylinder(d=M8_screw_diameter+.1, h=45, $fn=50);
                translate([0, 0, ALU_profile_holder_wall_thickness])
                cylinder(d=15, h=ALU_profile_holder_wall_thickness*4, $fn=50);
            }
            
            translate([-35-14-608_bearing_outer_diameter/2, ALU_profile_width/2-1, 0])
            rotate([-90, 0, 0])
            union() {
                cylinder(d=M8_screw_diameter, h=10, $fn=50);
                cylinder(d=M6_screw_diameter, h=50, $fn=50);
                
                translate([0, 0, 10+4])
                cylinder(d=M6_nut_diameter, h=50, $fn=6);
            }
            
            
            // profile holes
            translate([20, -ALU_profile_holder_wall_thickness*2+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
            rotate([-90, 0, 0])
            union() {
                cylinder(d=M6_screw_diameter, h=ALU_profile_holder_wall_thickness*4, $fn=50);
                translate([0, 0, ALU_profile_holder_wall_thickness*2])
                cylinder(d=15, h=ALU_profile_holder_wall_thickness*4, $fn=50);
            }
            
            translate([-20, -ALU_profile_holder_wall_thickness*2+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
            rotate([-90, 0, 0])
            union() {
                cylinder(d=M6_screw_diameter, h=ALU_profile_holder_wall_thickness*6, $fn=50);
                translate([0, 0, ALU_profile_holder_wall_thickness*2])
                cylinder(d=15, h=ALU_profile_holder_wall_thickness*6, $fn=50);
            }
        }
    }
    
    
//    translate([35+14+608_bearing_outer_diameter/2, ALU_profile_holder_wall_thickness+(ALU_profile_width/2+ALU_profile_holder_wall_thickness), 0])
//    rotate([90, 0, 0])
//    #cylinder(d=M8_screw_diameter, h=45, $fn=50);
}

888_5012();

rotate([0, 0, 180])
888_5012();
#888_5012_attachment_points();
