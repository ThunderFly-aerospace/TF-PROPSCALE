include <./parameters.scad>
use <./src/lib/ALU_profile.scad>
use <./src/888_3007.scad>
use <./src/888_5001.scad>
use <./src/888_5002.scad>
use <./src/888_5003.scad>
use <./src/888_5004.scad>
use <./src/888_5005.scad>
use <./src/888_5006.scad>
use <./src/888_5008.scad>
use <./src/888_5009.scad>
use <./src/888_5010.scad>
use <./src/888_5011.scad>
use <./src/888_5013.scad>
use <./src/888_5014.scad>
use <./src/888_1001.scad>
use <./src/888_1002.scad>
use <./src/888_1003.scad>
use <./src/Motor_Adapter.scad>

side_pillars_offset = -ALU_profile_width/2;
0_offset = (608_bearing_outer_diameter+10)/2-1;

module tenzometer(mounting_part=true) {
    translate([-strain_gauge_length/2, -strain_gauge_width/2, 0])
    color([0, 0, 1])
    cube([strain_gauge_length, strain_gauge_width, strain_gauge_width]);
    
    if (mounting_part) {
        translate([strain_gauge_length/2-(strain_gauge_screw_distance*1.75)/2, 0, 0])
        rotate([0, 0 ,90])
        color([0, 1, 1])
        888_5002();
    }
}


// base ///////////////////////////////////////////////////////////////
translate([-base_length/2, 0, ALU_profile_width/2])
rotate([0, 90, 0])
ALU_profile(height=base_length);

translate([-base_length/2, base_width/2-ALU_profile_width/2, ALU_profile_width/2])
rotate([0, 90, 0])
ALU_profile(height=base_length);

translate([-base_length/2, -base_width/2+ALU_profile_width/2, ALU_profile_width/2])
rotate([0, 90, 0])
ALU_profile(height=base_length);

translate([-base_length/2-ALU_profile_width/2, -base_length/2, ALU_profile_width/2])
rotate([0, 90, 90])
ALU_profile(height=base_length);

translate([base_length/2+ALU_profile_width/2, -base_length/2, ALU_profile_width/2])
rotate([0, 90, 90])
ALU_profile(height=base_length);

// car attachment point
translate([30, -24.8, 0])
rotate([0, 0, 180])
color([0, 1, 1])
888_3007();

//box
translate([base_length/2, -ALU_profile_width/2, ALU_profile_width])
rotate([0, 0, 180])
color([0, 1, 1])
888_5014_back();

translate([base_length/2-150, -ALU_profile_width/2, ALU_profile_width])
rotate([0, 0, 180])
color([0, 1, 1])
888_5014_front();

translate([base_length/2+ALU_profile_width/2, -ALU_profile_width/2+electro_box_width+ALU_profile_width, ALU_profile_width+3])
rotate([0, 0, 180])
color([0, 1, 1])
#cube([electro_box_length, electro_box_width, electro_box_height]);

// front tower hinges attachment points
translate([ALU_profile_width*.75+front_tower_offset, -base_width/2+ALU_profile_width+ALU_profile_holder_wall_thickness*2, 0-ALU_profile_holder_wall_thickness])
rotate([0, -90 ,0])
color([0, 1, 1])
888_5005();
    
translate([-ALU_profile_width*.75+front_tower_offset, base_width/2-ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0-ALU_profile_holder_wall_thickness])
rotate([0, -90, 180])
color([0, 1, 1])
888_5005();

// back tower hinges attachment points
translate([ALU_profile_width*.75-back_tower_offset, -base_width/2+ALU_profile_width+ALU_profile_holder_wall_thickness*2, 0-ALU_profile_holder_wall_thickness])
rotate([0, -90 ,0])
color([0, 1, 1])
888_5005();
    
translate([-ALU_profile_width*.75-back_tower_offset, base_width/2-ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0-ALU_profile_holder_wall_thickness])
rotate([0, -90, 180])
color([0, 1, 1])
888_5005();

// back pillar //////////////////////////////////////////////////////
translate([-base_length/2-ALU_profile_width/2, 0, ALU_profile_width])
ALU_profile(height=520);

translate([-base_length/2+ALU_profile_holder_wall_thickness*2, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, tower_height+ALU_profile_width*1.5+54+608_bearing_outer_diameter-tower_drag_z_offset/2])
rotate([180, 0, 90])
color([0, 1, 1])
888_5001(false);


// front tower ///////////////////////////////////////////////////////////////////
translate([front_tower_offset, base_width/2-ALU_profile_width, ALU_profile_width+0+35])
rotate([tower_angle, 0 ,0])
translate([0, ALU_profile_width/2 ,0])
ALU_profile(height=tower_arm_length);

translate([front_tower_offset, -base_width/2+ALU_profile_width, ALU_profile_width+0+35])
rotate([-tower_angle, 0 ,0])
translate([0, -ALU_profile_width/2 ,0])
ALU_profile(height=tower_arm_length);

// tower hinges
translate([front_tower_offset, 0, ALU_profile_width+0])
color([0, 1, 1])
888_5006(side=-1);
    
translate([front_tower_offset, 0, ALU_profile_width+0])
color([0, 1, 1])
888_5006(side=1);

// front tringle joint   
translate([front_tower_offset, 0, ALU_profile_width+0+35])
rotate([0, 0, 0])
color([0, 1, 1])
888_5008();


// back tower ///////////////////////////////////////////////////////////////////
translate([-back_tower_offset, base_width/2-ALU_profile_width, ALU_profile_width+0+35])
rotate([tower_angle, 0 ,0])
translate([0, ALU_profile_width/2 ,0])
ALU_profile(height=tower_arm_length);

translate([-back_tower_offset, -base_width/2+ALU_profile_width, ALU_profile_width+0+35])
rotate([-tower_angle, 0 ,0])
translate([0, -ALU_profile_width/2 ,0])
ALU_profile(height=tower_arm_length);

// tower hinges
translate([-back_tower_offset, 0, ALU_profile_width+0])
color([0, 1, 1])
888_5006(side=-1);
    
translate([-back_tower_offset, 0, ALU_profile_width+0])
color([0, 1, 1])
888_5006(side=1);

// back tringle joint  
translate([-back_tower_offset, 0, ALU_profile_width+0+35])
rotate([0, 0, 0])
color([0, 1, 1])
888_5008();

// tower bridge ////////////////////////////////////////////////////////////////////
translate([-back_tower_offset-ALU_profile_width*1.5-ALU_profile_holder_wall_thickness*2, 0, tower_height+ALU_profile_holder_wall_thickness*3+ALU_profile_width*2.5+53+608_bearing_outer_diameter])
rotate([0, 90, 0])
ALU_profile(height=400);

translate([-back_tower_offset+(608_bearing_outer_diameter+10)/2-ALU_profile_width*2-ALU_profile_holder_wall_thickness*2-5-2, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, tower_height+ALU_profile_holder_wall_thickness*3+ALU_profile_width*2+53+608_bearing_outer_diameter])
rotate([0, 0, 90])
color([0, 1, 1])
888_5001();

translate([-back_tower_offset+(608_bearing_outer_diameter+10)/2-ALU_profile_holder_wall_thickness*2+1, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, tower_height+ALU_profile_holder_wall_thickness+ALU_profile_width*2+53+608_bearing_outer_diameter])
rotate([-90, 0, 90])
color([0, 1, 1])
888_5004();

translate([front_tower_offset+(608_bearing_outer_diameter+10)/2-ALU_profile_holder_wall_thickness*2+1, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, tower_height+ALU_profile_holder_wall_thickness+ALU_profile_width*2+53+608_bearing_outer_diameter])
rotate([-90, 0, 90])
color([0, 1, 1])
888_5004();

// drag strain gauge attachment point
translate([-back_tower_offset+(608_bearing_outer_diameter+10)/2-ALU_profile_width*2-ALU_profile_holder_wall_thickness*2-10-2, 0, tower_height+ALU_profile_holder_wall_thickness+ALU_profile_width*2+53+608_bearing_outer_diameter-tower_drag_z_offset/2])
rotate([0, 90, 180])
tenzometer(mounting_part=false);

translate([200-ALU_profile_holder_wall_thickness*3, ALU_profile_width/2+ALU_profile_holder_wall_thickness, tower_height+ALU_profile_holder_wall_thickness*3+ALU_profile_width*2+53+608_bearing_outer_diameter])
rotate([0, 0, -90])
color([0, 1, 1])
888_5009();

translate([200-ALU_profile_holder_wall_thickness*3+10, 0, tower_height+ALU_profile_holder_wall_thickness*3+ALU_profile_width*3+53+608_bearing_outer_diameter+0.64])
rotate([90, 0, 90])
color([0, 1, 1])
Motor_Adapter();

// calibration device //////////////////////////////////////////////////////////////
translate([-base_length/2, -ALU_profile_width/2, 0+tower_height+20])
rotate([0, 0, 180])
color([1, 1, 0])
union() {
    888_1001();
    
    translate([calibration_arm_x_offset, -.5, calibration_arm_y_offset])
    rotate([90, 0, 0])
    888_1002();
}