//Track Joining Plates

yPos1 = 10;
yPos2 = 70;
yPos3 = 90;
radius = 2.75;

module JoinPlate()
{
    offset(3) offset(-3)
    difference()
    {
        hull()
        {
            square([100, 19.99]);
            translate([30, 70]) square([40, 30]);
        }
        //Add them crappy circular holes
        translate([10, yPos1]) circle(radius);
        translate([30, yPos1]) circle(radius);
        translate([70, yPos1]) circle(radius);
        translate([90, yPos1]) circle(radius);
        
        translate([30, yPos2]) circle(radius);
        translate([50, yPos2]) circle(radius);
        translate([70, yPos2]) circle(radius);
        
        translate([50, yPos3]) circle(radius);
    }
}

module JoinPlate3D()
{
    linear_extrude(5) JoinPlate();
}
JoinPlate3D();