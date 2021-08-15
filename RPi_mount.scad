// L x W x H of the Pi currently
BASE_LENGTH = 85;
BASE_WIDTH = 56;
BASE_DEPTH = 2.5;

// Change this to include/exclude a hat
MOUNT_HEIGHT = 14;

// m2.5 mounting holes
MOUNT_DIA = 2.5;
MOUNT_PITCH = 0.45;

STANDOFF_DIA = 3.2;
STANDOFF_HEIGHT = 3.0;

include <roundCornersCube.scad>
include <threads.scad>

module pi_support()
{
    translate([0, 0, BASE_DEPTH / 2])
    {
        difference()
        {
            roundCornersCube(BASE_LENGTH
        , BASE_WIDTH, BASE_DEPTH, 3.0);
            roundCornersCube(BASE_LENGTH
         * 0.9, BASE_WIDTH * 0.8, BASE_DEPTH, 3.0);
        }
        translate([-BASE_LENGTH / 2, -BASE_WIDTH / 2, BASE_DEPTH / 2])
        {
            translate([3.5, 3.5, 0])
            {
                union()
                {
                    metric_thread(MOUNT_DIA, 0.45, MOUNT_HEIGHT);
                    cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = 36);
                }
            }
            translate([(3.5 + 29 + 29), 3.5, 0])
            {
                union()
                {
                    metric_thread(MOUNT_DIA, 0.45, MOUNT_HEIGHT);
                    cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = 36);
                }
            }
            translate([3.5, 56 - 3.5, 0])
            {
                union()
                {
                    metric_thread(MOUNT_DIA, 0.45, MOUNT_HEIGHT);
                    cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = 36);
                }
            }
           
            translate([(3.5 + 29 + 29), 56 - 3.5, 0])
            {
                union()
                {
                    metric_thread(MOUNT_DIA, 0.45, MOUNT_HEIGHT);
                    cylinder(STANDOFF_HEIGHT, d = STANDOFF_DIA, $fn = 36);
                }
            }
        }
    }
}

pi_support();