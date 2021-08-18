include <rectangular_mount.scad>

// Mount for an Adafruit Mono Enclosed Speaker - 3W 4 Ohm
// From: https://www.adafruit.com/product/3351#technical-details
color("lightgreen", 1.0)
rectangular_mount(mount_rect_x = 63, mount_rect_y = 24, 
    mount_dia = 2.8, mount_pitch = 0.5, mount_height = 15, 
    standoff_height = 11,
    use_threads = 0);

// Reference model
color("gray", 0.5)
translate([0, 0, 1])
import("models/AdaFruit_Mono_enclosed_speaker.stl");