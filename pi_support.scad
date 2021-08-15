// L x W x H of the Pi currently
BASE_LENGTH = 85;
BASE_WIDTH = 56;
BASE_DEPTH = 2.5;

// Change this to include/exclude a hat
MOUNT_HEIGHT = 14;
MOUNT_SIDES = 36;

// m2.5 mounting holes
MOUNT_DIA = 2.5;
MOUNT_PITCH = 0.45;

STANDOFF_DIA = 3.2;
STANDOFF_HEIGHT = 3.0;
STANDOFF_SIDES = 36;

include <roundCornersCube.scad>
include <threads.scad>

module pi_support(mount_height = MOUNT_HEIGHT, standoff_height = STANDOFF_HEIGHT, standoff_dia = STANDOFF_DIA, no_threads = 1)
{
    mount_sides = MOUNT_SIDES;
    standoff_sides = STANDOFF_SIDES;

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
                    if (no_threads == 1)
                        cylinder(mount_height, d = MOUNT_DIA, $fn = mount_sides);
                    else
                        metric_thread(MOUNT_DIA, MOUNT_PITCH, mount_height);
                    cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
                }
            }
            translate([(3.5 + 29 + 29), 3.5, 0])
            {
                union()
                {
                    if (no_threads == 1)
                        cylinder(mount_height, d = MOUNT_DIA, $fn = mount_sides);
                    else
                        metric_thread(MOUNT_DIA, MOUNT_PITCH, mount_height);
                    cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
                }
            }
            translate([3.5, 56 - 3.5, 0])
            {
                union()
                {
                    if (no_threads == 1)
                        cylinder(mount_height, d = MOUNT_DIA, $fn = mount_sides);
                    else
                        metric_thread(MOUNT_DIA, MOUNT_PITCH, mount_height);
                    cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
                }
            }
           
            translate([(3.5 + 29 + 29), 56 - 3.5, 0])
            {
                union()
                {
                    if (no_threads == 1)
                        cylinder(mount_height, d = MOUNT_DIA, $fn = mount_sides);
                    else
                        metric_thread(MOUNT_DIA, MOUNT_PITCH, mount_height);
                    cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
                }
            }
        }
    }
}