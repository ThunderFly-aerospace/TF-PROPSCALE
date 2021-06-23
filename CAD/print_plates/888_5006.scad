//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
include <../src/888_5006.scad>

translate([0, base_width/2, ALU_profile_width/2+ALU_profile_holder_wall_thickness*2])
rotate([0, -90, 0])
888_5006(1);