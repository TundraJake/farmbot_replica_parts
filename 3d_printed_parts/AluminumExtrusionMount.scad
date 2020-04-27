// Jacob McKenna
// UAF CS 600 Robotics
// Mount for DriveTrain
$fn = 60;

module Fillet(){
    offset(-1.4) offset(1.4) children();
}

module Smooth(){
    offset(.5) offset(-.5) children();
}

module AluminumExtrusionMount(){
    mountWidth = 25;
    baseHeight = 10;
    
    
    
    module Column(){
        extrusionWidth = 20.1;
        columnHeight = 30;
        linear_extrude(columnHeight) difference(){
            Smooth() square([mountWidth, mountWidth], center=true);
            Smooth() square([extrusionWidth, extrusionWidth], center=true);
        }
    }
    
    module ExtrusionSlot(){
        width = 24;
        height = 40;
        perimeterWidth = width - 2;
        translate([0,0,height/2]) difference(){
            cube([width,width,height], center=true);
            cube([perimeterWidth,perimeterWidth,height], center=true);
            rotate([90,0,0]) cylinder(r=2.5, h= 30, center=true);
        }
    }
   
    // Base Cutouts
    module DriveTrainCutout(){
        driveTrainWidth = 8;
        cutoutHeight = 6;
        cube([driveTrainWidth, 100, cutoutHeight], center=true);
    }
    
    module ScrewCutout(){
        screwRadius = 2.45;
        screwHeadRadius = 4.4;
        screwHeadHeight = 2.3;
        translate([0,0, baseHeight - screwHeadHeight]) cylinder(r1=screwRadius, r2=screwHeadRadius, h=screwHeadHeight);
        translate([0,0,0]) cylinder(r=screwRadius, h =baseHeight);
    }
    
    
    
    module Base(){
        difference(){
            union(){
                linear_extrude(baseHeight) Smooth() square([mountWidth, mountWidth], center=true);
                ExtrusionSlot();
            }  
            ScrewCutout();
            DriveTrainCutout();
        }
    }
    
    Base();
    //Column();
}


AluminumExtrusionMount();