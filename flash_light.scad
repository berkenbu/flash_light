
LED_d = 5;

Bat_r = 10;
Bat_d = 8;

edge_r = 1;

// base
%difference() {
	difference() {	
		linear_extrude(height=Bat_d+2*edge_r) {
			hull() {
				translate([Bat_r+5, 0]) square([LED_d+edge_r*1.5, 6], center=true);	
				circle(r=Bat_r+edge_r);
			}
		}
		translate([0, 0, edge_r]) cylinder(r=Bat_r, h=Bat_d+edge_r);
	}
	translate([Bat_r+4, 0, Bat_d/2+edge_r]) rotate([0, 90, 0]) cylinder(r=LED_d/2, h=5, $fn=30);
	translate([Bat_r-1, 0, Bat_d/2+edge_r]) rotate([0, 90, 0]) cylinder(r=LED_d/2+0.5, h=5, $fn=30);
}

// loop
%difference() {
	translate([-Bat_r-edge_r-1, 0, 1]) rotate_extrude($fn=20) translate([3.5, 0, 0]) circle(r=1, $fn=20);
	cylinder(r=Bat_r+edge_r, 2);
}

// lid
union() {
	difference() {
		cylinder(r=Bat_r-edge_r, h=1, $fn=60);
		translate([Bat_r/2+2.5,0,0]) cube([Bat_r, 2*Bat_r, 2], center=true);
  		translate([-(Bat_r/2+2.5),0,0]) cube([Bat_r, 2*Bat_r, 2], center=true);
		translate([0, Bat_r/2, 0]) cube([Bat_r, Bat_r, Bat_r], center=true);
	}
	cylinder(r=Bat_r-edge_r*2.5, h=1, $fn=60);
	translate([0, 2, 1]) cylinder(r=3, h=4, $fn=40);

	difference() {
		cylinder(r=Bat_r, h=3, $fn=60);
		cylinder(r=Bat_r-edge_r*2, h=4, $fn=60);
	}
}
