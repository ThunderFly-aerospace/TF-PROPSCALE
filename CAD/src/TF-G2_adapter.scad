include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./888_5002.scad>


end_thickness = 3;
end_height = 65;
thickness = 5;
height = 45;

module TF_G2_mount() {
    
    // pripevneni k ramu vahy
    translate([-ALU_profile_width/2 - ALU_profile_holder_wall_thickness, 0, 0]) union() {
        translate([0, -ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0])
        ALU_profile_holder_side(ALU_profile_width);
    }
    
    translate([0, 2.5, ALU_profile_width/2]) cube([75+thickness*2, 5, ALU_profile_width], center=true);
    
    for(r  = [-1, 0]) mirror([r, 0, 0]){
        translate([75/2, 0, 0]) cube([thickness, height, ALU_profile_width]);
        translate([75/2, 0, 0]) cube([end_thickness, end_height, ALU_profile_width]);
    }
}


module TF_G2_mount_A(){
    difference(){
        TF_G2_mount();
        translate([0, end_height-10, ALU_profile_width/2 - 5]) rotate([0, 90, 0]) hull(){
            cylinder(d = 10, h=100, center=true);
            translate([-20, 20, 0]) cylinder(d = 10, h=100, center=true);
        }
    }
}

TF_G2_mount_A();


