// Case for a Raspberry Pi 4 with Respeaker 2/4 mic hat and an 8W mono Adafruit speaker 

include <../roundCornersCube.scad>
include <../rectangular_mount.scad>

CASE_THICKNESS = 2.5;
CASE_LENGTH = 95;
CASE_WIDTH = 100;
CASE_HEIGHT = 25;
CASE_CORNER_RADIUS = 3;

PI_OFFSET_X = 0;
PI_OFFSET_Y = -18;

SPEAKER_OFFSET_X = 0;
SPEAKER_OFFSET_Y = 30;

SD_CARD_CUTOUT = 1;

REFERENCE_MODELS = 1;

translate([0, 0, (CASE_HEIGHT + CASE_THICKNESS) / 2])
{
    difference()
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

        // Cutout for accessing the SD card
        if (SD_CARD_CUTOUT == 1)
        {
            translate([-50, -25, -CASE_HEIGHT + 8])
            cube([8, 15, 12]);
        }

        // Cutout for charger
        rotate([90, 0, 0])
        translate([-31, -3, 15])
        roundCornersCube(15.0, 8.0, 100, 1.5);

        // Cutout for stereo jack
        rotate([90, 0, 0])
        translate([11.5, -2, 35])
        cylinder(20, d = 8, $fn = 36);
    }
}

translate([PI_OFFSET_X, PI_OFFSET_Y, CASE_THICKNESS])2021-08-20-01-17-02.png
{
    // Mount for a Raspberry Pi 3/4
    // From: https://datasheets.raspberrypi.org/rpi4/raspberry-pi-4-mechanical-drawing.pdf
    rotate([0, 0, 180])
    rectangular_mount(base_rect_x = 85, base_rect_y = 56, base_height = 0,
        mount_rect_x = 58, mount_rect_y = 49, 
        mount_offset_x = (85 - (29 + 29 + 3.5 + 3.5)) / 2,
        mount_offset_y = 0, 
        mount_dia = 2.3, mount_pitch = 0.45, mount_height = 20,
        standoff_dia = 5, standoff_height = 6);

    // Reference model
    if (REFERENCE_MODELS == 1)
    {
        translate([0.25, -1, 4])
        import("models/Raspberry_pi_4.stl");
    }
}

translate([SPEAKER_OFFSET_X, SPEAKER_OFFSET_Y, CASE_THICKNESS])
{
    // Mount for an Adafruit Mono Enclosed Speaker - 3W 4 Ohm
    // From: https://www.adafruit.com/product/3351#technical-details
    rectangular_mount(base_height = 0, mount_rect_x = 63, mount_rect_y = 24,
        mount_dia = 2.8, mount_pitch = 0.5, mount_height = 20, 
        standoff_dia = 5, standoff_height = 11,
        use_threads = 0);

    // Reference model
    if (REFERENCE_MODELS == 1)
    {
        translate([0, 0, 1])
        import("models/AdaFruit_Mono_enclosed_speaker.stl");
    }
}