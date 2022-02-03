include <../parameters.scad>

IMU_diameter = 6;
IMU_width = 38.55;
IMU_height = 22.6;
IMU_length = 46.64;

cable_dia = 10.5+1;
cable_height = 15;
cable_gap = 22;

left_conn_width = 12;
left_conn_height = 9;

right_conn_width = 16;
right_conn_height = 9.5;
right_conn_bot_gap = 7.5;

module IMU_CAN_adapter() {
	difference() {
		// whole body
		union() {
			translate([-2, -2, 0])
			minkowski() {
				cube([IMU_length-IMU_diameter+4.2, IMU_width-IMU_diameter+4.2, 1]);
				cylinder(d=6, h=IMU_height-1, $fn=30);
			}

			translate([-5-10, IMU_diameter/4, 0])
			cube([IMU_length+5+20, ALU_profile_width, 3]);
		}

		// holding screws
		translate([-5-10, ALU_profile_width/2+IMU_diameter/4, -1])
		cylinder(d=M6_screw_diameter, h=5, $fn=30);

		translate([IMU_length+10, ALU_profile_width/2+IMU_diameter/4, -1])
		cylinder(d=M6_screw_diameter, h=5, $fn=30);

		// IMU inside cutout
		translate([0, 0, -1])
		minkowski() {
			cube([IMU_length-IMU_diameter+0.2, IMU_width-IMU_diameter+0.2, 1]);
			cylinder(d=6, h=IMU_height+1, $fn=30);
		}

		// cable holes
		translate([0, 0, cable_height])
		union() {
			rotate([0, 90, 0])
			translate([0, (IMU_width-IMU_diameter+cable_gap)/2, -10])
			cylinder(d=cable_dia, h=IMU_length+10, $fn=30);

			rotate([0, 90, 0])
			translate([0, (IMU_width-IMU_diameter-cable_gap)/2, -10])
			cylinder(d=cable_dia, h=IMU_length+10, $fn=30);
		}

		// left connector hole
		translate([-3+IMU_length/2-left_conn_width/2, -5, -.01])
		cube([left_conn_width, 10, left_conn_height]);

		// right connector hole
		translate([-3+IMU_length/2-right_conn_width/2, -5+IMU_width, right_conn_height])
		cube([right_conn_width, 10, right_conn_height]);
	}
}

IMU_CAN_adapter();
