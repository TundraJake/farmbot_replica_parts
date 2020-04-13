// Jacob McKenna
// UAF CS 600 Robotics
$fn = 30;
topLength = 120;
topHeight = 20;

bottomLength = 100;
bottomHeight = 20;

bottomWheelMountLocStart = [8, -40, 0];

wheelOffset = 32;
bottomWheelOffset = 15;
wheelStartPos = 14;

M5Radius = 5 / 2 + .3;
M5BoltHeadRadius = 5;
M5BoltHeadHeight = 4.1;

thickness = 8;

module TopWheelMount(){
    difference(){
        union(){
            square([topLength, topHeight]);
        }
    }
}

module BottomWheelMount(){
    translate(bottomWheelMountLocStart)
    square([bottomLength, bottomHeight]);
}

module Connector(){
    y = bottomWheelMountLocStart[1];
    x = bottomWheelMountLocStart[0];
    angle = atan(y/x);
    cutoff = x*6;
    difference(){
            rotate([0, 0, angle]) square([y * -2, 10]);
            translate([0, y-cutoff, 0]) square([cutoff,cutoff]) ;
    }
}

module WheelCones(x, y, z=thickness){
    translate([x, y, z])
        cylinder(r1=5, r=3.5, h=z);
}

module TopWheelCones(){
    translate([0, topHeight/2, 0])
        for (i = [0:3])
            WheelCones(wheelStartPos + i*wheelOffset,0);
}

module BottomWheelCones(){
    y = topHeight/2 - 12.5 - 20 - 8.5;
    translate([0, y, 0])
        for (i = [0:2])
            WheelCones(wheelStartPos +i*wheelOffset + bottomWheelOffset,0);
}

module TopWheelSlots(){
    translate([0, topHeight/2, 0])
        for (i = [0:3]){
            translate([wheelStartPos + i*wheelOffset,0,0]) cylinder(r=M5Radius, h=thickness*2);
            translate([wheelStartPos + i*wheelOffset,0,0]) cylinder(r=M5BoltHeadRadius * 1.2, h=M5BoltHeadHeight);
        }
}

module BottomWheelSlots(){
    y = topHeight/2 - 12.5 - 20 - 8.5;
    translate([0, y, 0])
        for (i = [0:2]){
            translate([wheelStartPos +i*wheelOffset + bottomWheelOffset,0,0]) cylinder(r=M5Radius, h=thickness*2);
            translate([wheelStartPos + i*wheelOffset + bottomWheelOffset,0,0]) cylinder(r=M5BoltHeadRadius * 1.2, h=M5BoltHeadHeight);
        }
}

module BoltTightenerCutout(){
    boltLength = 30;
    nutHeight = 5.5;
    radius = 1.6;
    headBoltRadius = 2.6;
    //1.6 real
    rotate([90,0,0]) translate([85,thickness/2 + .5,-3]) cube([5.5,8.0,3], center=true);
    rotate([90,0,0]) translate([85,thickness/2,-6]) cylinder(r=radius, h=boltLength);
    rotate([90,0,0]) translate([85,thickness/2,23]) cylinder(r=headBoltRadius, h=boltLength);
}

module Fillet(){
    offset(-1.4) offset(1.4) children();
}

module Smooth(){
    offset(2.1) offset(-2.1) children();
}





module DriveTrain(){
     difference() {
        union(){
            TopWheelCones();
            BottomWheelCones();
            linear_extrude(thickness) Smooth() Fillet() union(){
                TopWheelMount();
                Connector();
                BottomWheelMount();
            }
       }
       TopWheelSlots();
       BottomWheelSlots();
       BoltTightenerCutout();
    }
}

DriveTrain();