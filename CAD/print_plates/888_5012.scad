//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
use <../src/888_5012.scad>

translate([0, 0, -ALU_profile_width/2])
rotate([90, 0, 0])
888_5012();