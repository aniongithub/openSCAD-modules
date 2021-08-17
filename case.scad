include <roundCornersCube.scad>
include <pi_support.scad>

CASE_THICKNESS = 2.5;
CASE_LENGTH = 90;
CASE_WIDTH = 100;
CASE_HEIGHT = 20;
CASE_CORNER_RADIUS = 3;

PI_OFFSET_X = 0;
PI_OFFSET_Y = -20;

translate([0, 0, (CASE_HEIGHT + CASE_THICKNESS) / 2])
{
    union()
    {
        difference()
        {
            roundCornersCube(CASE_LENGTH + CASE_THICKNESS, CASE_WIDTH + CASE_THICKNESS, CASE_HEIGHT, CASE_CORNER_RADIUS);
            roundCornersCube(CASE_LENGTH, CASE_WIDTH, CASE_HEIGHT, CASE_CORNER_RADIUS);
        }
        translate([0, 0, -CASE_HEIGHT / 2])
            roundCornersCube(CASE_LENGTH + CASE_THICKNESS, CASE_WIDTH + CASE_THICKNESS, CASE_THICKNESS, CASE_CORNER_RADIUS);
    }
}
translate([PI_OFFSET_X, PI_OFFSET_Y, 0])
{
    pi_support(mount_height = 10);    
}

speaker_support();