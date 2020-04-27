// Jacob McKenna
// UAF CS 600 Robotics
// Gantry Mount
$fn = 60;

module Fillet(){
    offset(-1.4) offset(1.4) children();
}

module Smooth(){
    offset(.5) offset(-.5) children();
}






module GantryMount(){
    
    module ExtrusionSlot(){
        cutOutwidth = 25;
        height = 40;
        perimeterWidth = cutOutwidth - 5;
        translate([0,0,height/2]) difference(){
            cube([cutOutwidth,cutOutwidth,height], center=true);
            cube([perimeterWidth,perimeterWidth,height], center=true);
            rotate([90,0,0]) cylinder(r=2.5, h= 100, center=true);
        }
    }

    translate([0,0,10]) ExtrusionSlot();
    translate([0,-10,0]) rotate([90,0,0]) ExtrusionSlot();
    cube([25,25,25], center=true);
    
}


GantryMount();