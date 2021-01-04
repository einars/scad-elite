include <elite.scad>

$t=$t; // fix some magic wher running from command line: $t appears as 0 in assignments

ra = 360 * $t;
rb = 360 * $t;
rc = 360 * $t;

translate([-50, 0, 0])
rotate([ra, 180 + rb, 90 + rc])
elite_coriolis (r=160, center=true);

translate([400, 0, 0])
rotate([ra, rb, rc])
elite_thargoid (r=164, center=true);

translate([800, 0, 0])
rotate([ra, rb, rc])
elite_python (width=192, center=true);


translate([0, 500, 0])
rotate([ra, rb, rc])
elite_viper (width=96, center=true);

translate([200, 500, 0])
rotate([ra, rb, rc])
elite_mamba (width=128, center=true);

translate([500, 500, 0])
rotate([ra, rb, rc])
elite_cobra_mkiii (width=256, center=true);

translate([700, 500, 0])
rotate([ra, rb, rc])
elite_thargon (width=76, center=true);

translate([900, 500, 0])
rotate([ra, rb, rc])
elite_sidewinder (width=128, center=true);

