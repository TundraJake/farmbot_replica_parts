// Jacob McKenna
// UAF CS 600 Robotics
$fn = 30;
topLength = 105;
topHeight = 20;

bottomLength = 90;
bottomHeight = 20;

bottomWheelMountLocStart = [8, -40, 0];

wheelOffset = 35;
bottomWheelOffset = 15;
wheelStartPos = 16;

M5Radius = 5 / 2 + .3;

thickness = 9;

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
        cylinder(r1=5, r=2.8, h=z);
}

module TopWheelCones(){
    translate([0, topHeight/2, 0])
        for (i = [0:2])
            WheelCones(wheelStartPos + i*wheelOffset,0);
}

module BottomWheelCones(){
    y = topHeight/2 - 12.5 - 20 - 8.5;
    translate([0, y, 0])
        for (i = [0:1])
            WheelCones(wheelStartPos +i*wheelOffset + bottomWheelOffset,0);
}

module TopWheelSlots(){
    translate([0, topHeight/2, 0])
        for (i = [0:2])
            translate([wheelStartPos + i*wheelOffset,0,0]) cylinder(r=M5Radius, h=thickness*2);
}

module BottomWheelSlots(){
    y = topHeight/2 - 12.5 - 20 - 8.5;
    translate([0, y, 0])
        for (i = [0:1])
            translate([wheelStartPos +i*wheelOffset + bottomWheelOffset,0,0]) cylinder(r=M5Radius, h=thickness*2);
}

module BoltTightenerCutout(){
    boltLength = 30;
    nutHeight = 5;
    radius = 1.6;
    //1.6 real
    rotate([90,0,0]) translate([85,thickness/2,-3]) cube([6.5,18,3], center=true);
    rotate([90,0,0]) translate([85,thickness/2,-6]) cylinder(r=radius, h=boltLength);
    rotate([90,0,0]) translate([85,thickness/2,23]) cylinder(r=radius + 2, h=boltLength);
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
            linear_extrude(thickness) Smooth() Fillet() union(){;
                TopWheelMount();
                Connector();
                BottomWheelMount();
            }
       }
       TopWheelSlots();
       BottomWheelSlots();
       #BoltTightenerCutout();
    }
}

DriveTrain();