include <../parameters.scad>
use <./lib/ALU_profile_holder_side.scad>
use <./lib/ALU_profile.scad>
use <./888_5005.scad>
use <./888_5008.scad>
use <./888_5009.scad>
use <./888_5011.scad>


module 888_5011_attachment_points() {
    888_5008(false);
}

module 888_5007(print_plate=false) {
    
}

888_5011();
#888_5011_attachment_points();
