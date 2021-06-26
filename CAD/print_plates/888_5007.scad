//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
use <../src/888_5007.scad>

translate([tower_height, 0, ALU_profile_width/2])
rotate([0, -90, 0])
888_5007(true);