//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
use <../src/Motor_Adapter.scad>

translate([0, 0, ALU_profile_width/2+ALU_profile_holder_wall_thickness+M4_screw_diameter+M4_nut_diameter])
rotate([90, 0, 0])
Motor_Adapter();