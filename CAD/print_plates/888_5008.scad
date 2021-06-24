//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
include <../src/888_5008.scad>

translate([tower_height, 0, ALU_profile_width/2+ALU_profile_holder_wall_thickness*2])
rotate([0, -90, 0])
888_5008(true);