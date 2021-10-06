//@set_slicing_config(../slicing/default.ini)

include <../parameters.scad>
use <../src/TF-G2_adapter.scad>

TF_G2_mount_A();
translate([10, 75, 0])
rotate([0, 0, 180])
TF_G2_mount_A();