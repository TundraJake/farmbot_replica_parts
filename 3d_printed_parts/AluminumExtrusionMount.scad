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
    
    module b
    
    module ScrewCutout(){
        screwRadius = 2.45;
        screwHeadRadius = 4.4;
        screwHeadHeight = 2.3;
        translate([0,0, baseHeight - screwHeadHeight]) cylinder(r1=screwRadius, r2=screwHeadRadius, h=screwHeadHeight);
        translate([0,0,0]) cylinder(r=screwRadius, h =baseHeight);
    }
    
    module Base(){
        difference(){
            linear_extrude(baseHeight) Smooth() square([mountWidth, mountWidth], center=true);
            ScrewCutout();
        }
    }
    
    Base();
    //Column();
}


AluminumExtrusionMount();