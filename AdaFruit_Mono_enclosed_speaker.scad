MOUNT_LENGTH = 70;
MOUNT_WIDTH = 31;
MOUNT_HEIGHT = 17;

// m3 mounts with standoffs
MOUNT_DIA = 3.0;
MOUNT_PITCH = 0.5;

STANDOFF_DIA = 4;
STANDOFF_HEIGHT = 10;

MOUNT_RECT_X = 64;
MOUNT_RECT_Y = 31;

EDGE_RADIUS = 3.0;

SIDES = 36;
BOTTOM_HEIGHT = 1;

include <roundCornersCube.scad>
include <threads.scad>

module support()
{
    translate([0, 0, BOTTOM_HEIGHT / 2])
    union()
    {
        difference()
        {
            roundCornersCube(MOUNT_LENGTH, MOUNT_WIDTH, BOTTOM_HEIGHT, EDGE_RADIUS);
            roundCornersCube(MOUNT_LENGTH * 0.9, MOUNT_WIDTH * 0.8, BOTTOM_HEIGHT, EDGE_RADIUS);
        }
        translate([-MOUNT_RECT_X / 2 + 0.5, -MOUNT_RECT_Y / 2 + 3.5, 0])
            union()
            {
                metric_thread(MOUNT_DIA, MOUNT_PITCH, MOUNT_HEIGHT);
                cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = SIDES);
            }
        translate([MOUNT_RECT_X / 2 - 0.5, -MOUNT_RECT_Y / 2 + 3.5, 0])
            union()
            {
                metric_thread(MOUNT_DIA, MOUNT_PITCH, MOUNT_HEI2021-08-15-19-45-33.pngGHT);
                cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = SIDES);
            }
        translate([-MOUNT_RECT_X / 2 + 0.5, MOUNT_RECT_Y / 2 - 3.5, 0])
            union()
            {
                metric_thread(MOUNT_DIA, MOUNT_PITCH, MOUNT_HEIGHT);
                cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = SIDES);
            }
        translate([MOUNT_RECT_X / 2 - 0.5, MOUNT_RECT_Y / 2 - 3.5, 0])
            union()
            {
                metric_thread(MOUNT_DIA, MOUNT_PITCH, MOUNT_HEIGHT);
                cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = SIDES);
            }
    }
}

support();

// translate([0, 0, STANDOFF_HEIGHT/2 - 3])
//     import("models/AdaFruit_Mono_enclosed_speaker.stl");2021-08-15-19-32-48.png