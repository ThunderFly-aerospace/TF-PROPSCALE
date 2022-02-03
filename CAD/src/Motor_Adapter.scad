include <../parameters.scad>
use <./lib/rotor_joint.scad>

$fn = 100;

BaseThickness = 0;

TFPROBE01_PCB_thickness = 1.8;
TFPROBE01_PCB_width = 10.2;
TFPROBE01_sensor_height = 1.1;

thickness = motor_holder_thickness; //sirka sten - dost random

motor_diameter = 35.2;
side_thickness = 3;

//motor_y_shift = ALU_profile_width/2+ALU_profile_holder_wall_thickness+M4_screw_diameter+M4_nut_diameter-(motor_diameter+20)/2;
motor_y_shift = 0;

module Motor_Model() {
    // nahled motoru
    translate([0, -motor_y_shift, 50+10])
    rotate([0, 180, 0])
    union() {
        cylinder(d = motor_diameter, h = 50);
        translate([0, 0, -20])
        cylinder(d = 5, h = 50);
    }
}

module Motor_Adapter(){
    difference(){
        hull() {
            translate([0, -motor_y_shift, 0])
                scale([1, 0.6, 1])
                    cylinder(d=motor_diameter+20, h=50+10+5);
            
            translate([0, 0, thickness/2])
            rotor_joint_plate(thickness);
        }
        
        rotor_joint_holes(2,10, 55);
        
        union() {
            translate([-(motor_diameter+8)/2, -50, 5])
            cube([motor_diameter+8, 100, 50+10-thickness]);
            
            translate([0, -motor_y_shift, -1])
            cylinder(d=motor_diameter+10, h=6-0.2);
            translate([0, 0, 6]) cylinder(d=motor_diameter+10, h=50);
        }
            
        
        // Otvory pro pripevneni a vetrani motoru
        translate([0, -motor_y_shift, 50+10-thickness])
        union() {
            cylinder(d=13, h=20, $fn=100);
    
            for(x = [1,2,3,4])
                rotate([0, 0, 90*x])
                translate([0, 25/2, 0])
                cylinder(d = M3_screw_diameter, h = 20, $fn=20);
    
            for(x = [1,2,3,4])
                rotate([0, 0, 90*x+45])
                translate([0, 25/2, 0])
                hull(){
                    translate([2, 0, 0])
                    cylinder(d = M6_screw_diameter, h = 20, $fn=20);
                    
                    translate([0, 0, 0])
                    cylinder(d = 8, h = 20, $fn=20);
                    
                    translate([-2, 0, 0])
                    cylinder(d = M6_screw_diameter, h = 20, $fn=20);
                }
        }
    }
}

Motor_Adapter();

#Motor_Model();


