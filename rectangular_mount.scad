MOUNT_RECT_X = 64;
MOUNT_RECT_Y = 31;

MOUNT_DIA = 2;
MOUNT_PITCH = 0.5;
MOUNT_HEIGHT = 10;
MOUNT_SIDES = 36;

STANDOFF_DIA = 4;
STANDOFF_HEIGHT = 3;
STANDOFF_SIDES = 36;

BASE_HEIGHT = 1;
BASE_CORNER_RADIUS = 3;

USE_THREADS = 0;

MOUNT_ROTATION = 0;

include <roundCornersCube.scad>
include <threads.scad>

module rectangular_mount(mount_rect_x = MOUNT_RECT_X, mount_rect_y = MOUNT_RECT_Y, mount_offset_x = 0, mount_offset_y = 0, mount_rotation = MOUNT_ROTATION,
    mount_height = MOUNT_HEIGHT, mount_pitch = MOUNT_PITCH, mount_sides = MOUNT_SIDES, mount_dia = MOUNT_DIA,
    standoff_height = STANDOFF_HEIGHT, standoff_sides = STANDOFF_SIDES, standoff_dia = STANDOFF_DIA,
    base_rect_x = (MOUNT_RECT_X + STANDOFF_DIA + BASE_CORNER_RADIUS), base_rect_y = (MOUNT_RECT_Y + STANDOFF_DIA + BASE_CORNER_RADIUS),
    base_height = BASE_HEIGHT, base_corner_radius = BASE_CORNER_RADIUS, 
    use_threads = USE_THREADS)
{
    roundCornersCube(base_rect_x, base_rect_y, base_height, base_corner_radius);
    // translate([mount_offset_x, mount_offset_y, base_height / 2])
    union()
    {
        rotate([0, 0, mount_rotation])
        translate([(mount_rect_x / 2) + mount_offset_x, (mount_rect_y / 2) + mount_offset_y, -base_height / 2])
        {
            union()
            {
                if (use_threads == 0)
                    cylinder(mount_height, d = mount_dia, $fn = mount_sides);
                else
                    metric_thread(mount_dia, mount_pitch, mount_height);
                cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
            }
        }
        rotate([0, 0, mount_rotation])
        translate([-(mount_rect_x / 2) + mount_offset_x, (mount_rect_y / 2) + mount_offset_y, -base_height / 2])
        {
            union()
            {
                if (use_threads == 0)
                    cylinder(mount_height, d = mount_dia, $fn = mount_sides);
                else
                    metric_thread(mount_dia, mount_pitch, mount_height);
                cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
            }
        }
        rotate([0, 0, mount_rotation])
        translate([(mount_rect_x / 2) + mount_offset_x, -(mount_rect_y / 2) + mount_offset_y, -base_height / 2])
        {
            union()
            {
                if (use_threads == 0)
                    cylinder(mount_height, d = mount_dia, $fn = mount_sides);
                else
                    metric_thread(mount_dia, mount_pitch, mount_height);
                cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
            }
        }
        rotate([0, 0, mount_rotation])
        translate([-(mount_rect_x / 2) + mount_offset_x, -(mount_rect_y / 2) + mount_offset_y, -base_height / 2])
        {
            union()
            {
                if (use_threads == 0)
                    cylinder(mount_height, d = mount_dia, $fn = mount_sides);
                else
                    metric_thread(mount_dia, mount_pitch, mount_height);
                cylinder(standoff_height, d = standoff_dia, $fn = standoff_sides);
            }
        }
   }
}