// Jacob McKenna & William Fisher
// Design taken from Farbot 
$fs = 0.1;

startX = 10;
startY = 10;
noHeight = 0;
squareWidth = 60;
squareLength = 19.99;

edgeRadius = 5;
M5boltRadius = 2.5;
smoothValue = 3;

thickness = 5;

module TrackEnd()
{
    difference()
    {
        offset(smoothValue) offset(-smoothValue) hull()
        {
            translate([startX, startY, noHeight]) circle(r = edgeRadius); 
            translate([startX + 20, startY, noHeight]) circle(r = edgeRadius);
            translate([startX + 40, startY, noHeight]) circle(r = edgeRadius);
            translate([startX + 20, startY + 60, noHeight]) circle(r = edgeRadius);
            translate([startX + 40, startY + 60, noHeight]) circle(r = edgeRadius);
            translate([startX + 40, startY + 80, noHeight]) circle(r = edgeRadius);
            translate([startX + 20, 0, noHeight]) square([30, 100]);
            square([squareWidth, squareLength]);
        }    
    translate([startX, startY, noHeight]) circle(r = M5boltRadius);
    translate([startX + 20, startY, noHeight]) circle(r = M5boltRadius);
    translate([startX + 40, startY, noHeight]) circle(r = M5boltRadius);
    translate([startX + 20, startY + 60, noHeight]) circle(r = M5boltRadius);
    translate([startX + 40, startY + 60, noHeight]) circle(r = M5boltRadius);
    translate([startX + 40, startY + 80, noHeight]) circle(r = M5boltRadius);
    }
}

module TrackEndNotSharp()
{
    linear_extrude(thickness)

    TrackEnd();
}

TrackEndNotSharp();