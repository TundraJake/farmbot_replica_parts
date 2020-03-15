//Track End Plates
$fs = 0.1;

startX = 10;
startY = 10;
noHeight = 0;
squareWidth = 60;
squareLength = 19.99;

module TrackEnd()
{
    difference()
    {
            offset(3) offset(-3) hull()
        {
            translate([startX, startY, noHeight]) circle(5); 
            translate([startX + 20, startY, noHeight]) circle(5);
            translate([startX + 40, startY, noHeight]) circle(5);
            translate([startX + 20, startY + 60, noHeight]) circle(5);
            translate([startX + 40, startY + 60, noHeight]) circle(5);
            translate([startX + 40, startY + 80, noHeight]) circle(5);
            translate([startX + 20, 0, noHeight]) square([30, 100]);
            square([squareWidth, squareLength]);
        }    
    translate([startX, startY, noHeight]) circle(2);
    translate([startX + 20, startY, noHeight]) circle(2);
    translate([startX + 40, startY, noHeight]) circle(2);
    translate([startX + 20, startY + 60, noHeight]) circle(2);
    translate([startX + 40, startY + 60, noHeight]) circle(2);
    translate([startX + 40, startY + 80, noHeight]) circle(2);
    }
}

module TrackEndNotSharp()
{
    linear_extrude(5)

    TrackEnd();
}

TrackEndNotSharp();