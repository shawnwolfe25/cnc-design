// Parametric box for CNC (units: inches)
// Usage: change width, height, depth, wall_thickness and render/export as STL or 2D projection.

width = 12; // inches
height = 8; // inches
depth = 0.5; // thickness in inches
wall_thickness = 0.125; // 1/8"
corner_radius = 0.25; // inches
show_lid = true;
lid_overlap = 0.05; // overlap in inches

module rounded_rect(w, h, r) {
  if (r <= 0) {
    square([w, h], center=true);
  } else {
    minkowski() {
      square([w-2*r, h-2*r], center=true);
      circle(r=r, $fn=64);
    }
  }
}

difference() {
  // outer box
  translate([0,0,0]) linear_extrude(depth)
    rounded_rect(width, height, corner_radius);
  // inner cutout
  translate([0,0,wall_thickness]) linear_extrude(depth - wall_thickness)
    rounded_rect(width - 2*wall_thickness, height - 2*wall_thickness, max(0, corner_radius - wall_thickness));
}

if (show_lid) {
  translate([0, 0, depth + 0.05]) // offset for the lid preview
    color([0.8,0.6,0.6,0.6]) translate([0,0,0])
      linear_extrude(lid_overlap)
        rounded_rect(width, height, corner_radius);
}
