module _extrude_triangle(tri, h, h_base=[0, 0, 0], ccw=false) {
  
  points = [
    tri[0] + h_base,
    tri[1] + h_base,
    tri[2] + h_base,
    tri[0] + h,
    tri[1] + h,
    tri[2] + h,
  ];

  if (ccw == true) {
    points = [
      tri[0] + h_base,
      tri[2] + h_base,
      tri[1] + h_base,
      tri[0] + h,
      tri[2] + h,
      tri[1] + h,
    ];
  }

  polyhedron(points, faces = [
    [0, 1, 2], // top
    [3, 5, 4], // bottom
    [0, 2, 3], [2, 5, 3],
    [1, 0, 3], [1, 3, 4],
    [2, 1, 4], [2, 4, 5],
  ]);

}

module elite_coriolis (r=160, center=false) {

  s = r / 160;

  t = center ? [0, 0, 0] : [160, 160, 160];

  points = [
    [160, 0, 160], [0, 160, 160], [-160, 0, 160], [0, -160, 160], [160, -160, 0],
    [160, 160, 0], [-160, 160, 0], [-160, -160, 0], [160, 0, -160], [0, 160, -160],
    [-160, 0, -160], [0, -160, -160],
  ];

  scale([s, s, s])
  translate(t)
  difference()
  {
    polyhedron( points, faces = [
      [ 0, 4, 3], [ 0, 1, 5 ], [ 1, 2, 6 ], [ 2, 3, 7 ], [ 3, 4, 11, 7 ],
      [ 8, 4, 0, 5], [ 2, 7, 10, 6], [ 1, 6, 9, 5 ], [ 10, 7, 11 ], [ 8, 11, 4 ],
      [ 8, 5, 9 ], [ 6, 10, 9], [ 9, 10, 11, 8 ], [ 0, 3, 2, 1 ],
    ]);

    entry_width = 60;
    entry_height = 20;
    translate([- entry_height / 2, -entry_width / 2, 1])
    cube([entry_height, entry_width, 160]);
  }
}


module elite_cobra_mkiii (width=256, center=false) {

  s = width / 256;
  t = center ? [0, 0, 0] : [120, 26, 40];

  points = [
    [  32,   0,  76], [ -32,   0,  76], [   0,  26,  24], [-120,  -3,  -8], [ 120,  -3,  -8],
    [ -88,  16, -40], [  88,  16, -40], [ 128,  -8, -40], [-128,  -8, -40], [   0,  26, -40],
    [ -32, -24, -40], [  32, -24, -40],
  ];

  scale([s, s, s])
  translate(t)
  {
    difference()
    {
      polyhedron(points, faces=[
        [0, 1, 2], [1, 5, 2], [0, 2, 6], [1, 3, 5], [0, 6, 4],
        [2, 5, 9], [2, 9, 6], [3, 8, 5], [4, 6, 7], [7, 6, 9, 5, 8, 10, 11],
        [1, 10, 8, 3], [11, 10, 1, 0], [0, 4, 7, 11]
      ]);

      // backburner-1
      translate([0, 0, -40-2])
      linear_extrude(height=4)
      polygon(points=[[ -8, 12], [-36, 8], [-36, -12], [-8, -16]]);

      // backburner-1 fin
      translate([0, 0, -40-2])
      linear_extrude(height=4)
      polygon(points=[[-80, 6], [-80, -6], [-88, 0]]);

      // backburner-2
      translate([0, 0, -40-2])
      linear_extrude(height=4)
      polygon(points=[[ 8, 12], [36, 8], [36, -12], [8, -16]]);

      // backburner-2 fin
      translate([0, 0, -40-2])
      linear_extrude(height=4)
      polygon(points=[[80, 6], [80, -6], [88, 0]]);
    }

    // beam
    translate([0, 0, 76])
    cylinder(r=1, h=14);
  }
}



module elite_sidewinder (width=128, center=false) {

  s = width / 128;
  t = center ? [0, 0, 0] : [64, 16, 28];

  points = [
    [-32, 0, 36], [32, 0, 36], [64, 0, -28], [-64, 0, -28], [0, 16, -28],
    [0, -16, -28],
  ];


  scale([s, s, s])
  translate(t)
  {
    difference()
    {
      polyhedron(points, faces = [
        [0, 4, 1], [0, 1, 5], [1, 4, 2], [1, 2, 5], [0, 3, 4],
        [0, 5, 3], [3, 5, 2, 4],
      ]);

      // backburner
      translate([-12, -6, -28-2])
      cube([24, 12, 4]);
    }
  }

}


module elite_viper (width=96, center=false) {

  s = width / 96;
  t = center ? [0, 0, 0] : [48, 16, 24];

  points = [
    [0, 0, 72], [0, 16, 24], [0, -16, 24], [48, 0, -24], [-48, 0, -24],
    [24, -16, -24], [-24, -16, -24], [24, 16, -24], [-24, 16, -24], [-32, 0, -24],
    [32, 0, -24], [8, 8, -24], [-8, 8, -24], [-8, -8, -24], [8, -8, -24],
  ];

  scale([s, s, s])
  translate(t)
  {
    difference()
    {
      polyhedron(points, faces = [
        [0, 1, 7, 3], [0, 3, 5, 2], [0, 4, 8, 1], [0, 2, 6, 4], [1, 8, 7],
        [2, 5, 6], [3, 7, 8, 4, 6, 5],
      ]);

      // backburner-1
      translate([0, 0, -24-2])
      linear_extrude(height=4)
      polygon(points=[[ -32, 0], [-8, -8], [-8, 8]]);

      // backburner-2
      translate([0, 0, -24-2])
      linear_extrude(height=4)
      polygon(points=[[ 8, 8], [8, -8], [32, 0]]);

    }
  }
}


module elite_mamba (width=128, center=false) {

  s = width / 128;

  t = center ? [0, 0, 0] : [64, 8, 32];

  points = [
    [0, 0, 64], [-64, -8, -32], [-32, 8, -32], [32, 8, -32], [64, -8, -32],
  ];

  extrusions = [
    [-4, 4, 16], [4, 4, 16], [8, 3, 28], [-8, 3, 28], [-20, -4, 16],
    [20, -4, 16], [-24, -7, -20], [-16, -7, -20], [16, -7, -20], [24, -7, -20],
    [-8, 4, -32], [8, 4, -32], [8, -4, -32], [-8, -4, -32], [-32, 4, -32],
    [32, 4, -32], [36, -4, -32], [-36, -4, -32], [-38, 0, -32], [38, 0, -32],
  ];

  scale([s, s, s])
  translate(t)
  {
    difference()
    {
      polyhedron(points, faces = [
        [0, 4, 1], [0, 1, 2], [0, 3, 4], [2, 1, 4, 3], [0, 2, 3],
      ]);

      _extrude_triangle([extrusions[4], extrusions[7], extrusions[6]], h=[0, 1, 0], h_base=[0, -1, 0]);
      _extrude_triangle([extrusions[5], extrusions[9], extrusions[8]], h=[0, 1, 0], h_base=[0, -1, 0]);

      // practically invisible on default view :(
      _extrude_triangle([extrusions[0], extrusions[2], extrusions[3]], h=[0, 1, 0], h_base=[0, -1, 0]);
      _extrude_triangle([extrusions[0], extrusions[1], extrusions[2]], h=[0, 1, 0], h_base=[0, -1, 0]);

      translate([0, 0, -32-2])
      linear_extrude(height=4)
      polygon(points=[[ -8, 4], [8, 4], [8, -4], [-8, -4]]);

      translate([0, 0, -32-2])
      linear_extrude(height=4)
      polygon(points=[[ 32, 4], [36, -4], [38, 0]]);

      translate([0, 0, -32-2])
      linear_extrude(height=4)
      polygon(points=[[ -32, 4], [-36, -4], [-38, 0]]);

    }
  }
}



module elite_thargoid (r=164, center=false) {

  s = r / 164;
  t = center ? [0, 0, 0] : [24, 164, 164];

  points = [
    [32, -48, 48], [32, -68, 0], [32, -48, -48], [32, 0, -68], [32, 48, -48],
    [32, 68, 0], [32, 48, 48], [32, 0, 68], [-24, -116, 116], [-24, -164, 0],
    [-24, -116, -116], [-24, 0, -164], [-24, 116, -116], [-24, 164, 0], [-24, 116, 116],
    [-24, 0, 164],
  ];

  scale([s, s, s])
  translate(t)
  {
    difference()
    {
      polyhedron(points, faces = [
        [7, 0, 8, 15], [6, 7, 15, 14], [5, 6, 14, 13], [4, 5, 13, 12], [3, 4, 12, 11],
        [2, 3, 11, 10], [1, 2, 10, 9], [0, 1, 9, 8], [7, 6, 5, 4, 3, 2, 1, 0], [8, 9, 10, 11, 12, 13, 14, 15],
      ]);

      translate([-24-1, 0, 0])
      rotate([0, 90, 0])
      rotate([0, 0, 90])
      linear_extrude(height=4)
      polygon(points=[[ 64, 80 ], [ 64, -80 ], [ -64, -80 ], [ -64, 80 ]]);

    }
  }
}



module elite_thargon (width=76, center=false) {

  s = width / 76;
  t = center ? [0, 0, 0] : [9, 38, 32];

  points = [
    [-9, 0, 40], [-9, -38, 12], [-9, -24, -32], [-9, 24, -32], [-9, 38, 12],
    [9, 0, -8], [9, -10, -15], [9, -6, -26], [9, 6, -26], [9, 10, -15],
  ];

  scale([s, s, s])
  translate(t)
  {
    polyhedron(points, faces = [
      [1, 0, 5, 6], [0, 1, 2, 3, 4], [0, 4, 9, 5], [2, 1, 6, 7], [3, 2, 7, 8],
      [4, 3, 8, 9], [9, 8, 7, 6, 5],
    ]);
  }
}


module elite_python (width=192, center=false) {

  s = width / 192;
  t = center ? [0, 0, 0] : [96, 48, 112];

  points = [
    [0, 0, 224], [0, 48, 48], [96, 0, -16], [-96, 0, -16], [0, 48, -32],
    [0, 24, -112], [-48, 0, -112], [48, 0, -112], [0, -48, 48], [0, -48, -32],
    [0, -24, -112],
  ];

  scale([s, s, s])
  translate(t)
  {
    polyhedron(points, faces = [
    [0, 8, 3], [0, 2, 8], [0, 3, 1], [0, 1, 2], [2, 1, 4],
    [1, 3, 4], [2, 4, 5, 7], [3, 6, 5, 4], [2, 9, 8], [3, 8, 9],
    [2, 7, 10, 9], [3, 9, 10, 6], [5, 6, 10, 7],
    ]);
  }
}

