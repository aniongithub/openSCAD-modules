include <rectangular_mount.scad>

// Mount for a Raspberry Pi 3/4
// From: https://datasheets.raspberrypi.org/rpi4/raspberry-pi-4-mechanical-drawing.pdf
color("lightgreen", 1.0)
rectangular_mount(base_rect_x = 85, base_rect_y = 56, base_height = 2.5,
    mount_rect_x = 58, mount_rect_y = 49, 
    mount_offset_x = (85 - (29 + 29 + 3.5 + 3.5)) / 2,
    mount_offset_y = 0, 
    mount_dia = 2.5, mount_pitch = 0.45, mount_height = 14,
    standoff_height = 4);

// Reference model
rotate([0, 0, 180])
translate([0.25, -1, 1.5])
color("gray", 0.5)
import("models/Raspberry_pi_4.stl");