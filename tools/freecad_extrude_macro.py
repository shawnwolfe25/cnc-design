"""
FreeCAD macro: import an SVG, extrude shapes, and export an STL
Place this in FreeCAD macro folder and run from within FreeCAD.
This macro:
- Asks for an SVG file path
- Imports the SVG into the document
- Converts top-level shapes to Part solids (simple loops)
- Pads (extrudes) each face by a configured thickness
- Exports an STL of the assembled plate

Note: This is a simple macro that works best with clean SVGs (single closed paths for cut outlines).
"""

import FreeCAD, Part, Mesh
from FreeCAD import Base
import Import

DOC = FreeCAD.newDocument("SVG_Extrude")

svg_path = FreeCADGui.Selection.getSelection()

if not svg_path:
    svg_file = FreeCADGui.InputDialog.show("Enter SVG path to import:", "/path/to/file.svg")
else:
    svg_file = svg_path[0].Name

# Fallback prompt if above doesn't work
svg_file = FreeCADGui.Prompt("SVG file to import (full path): ", "")

thickness = 0.5  # inches by default - set to desired thickness

# Import SVG
Import.insert(svg_file, DOC.Name)

# Rough conversion: collect Draft wires / shapes and make faces then pad
for obj in DOC.Objects:
    try:
        shp = obj.Shape
        # Only try to pad closed planar faces
        if shp.Faces:
            for f in shp.Faces:
                pad = f.extrude(Base.Vector(0,0,thickness))
                part_obj = DOC.addObject("Part::Feature", "Pad_%s" % obj.Name)
                part_obj.Shape = pad
    except Exception as e:
        FreeCAD.Console.PrintMessage("Skipping %s: %s\n" % (obj.Name, str(e)))

DOC.recompute()

# Fuse all pads into one solid
pads = [o for o in DOC.Objects if o.Name.startswith('Pad_')]
if pads:
    fused = pads[0]
    for p in pads[1:]:
        fused.Shape = fused.Shape.fuse(p.Shape)

    # Export to STL
    stl_path = FreeCADGui.Prompt("STL output path:", "./output_extrude.stl")
    Mesh.export([fused], stl_path)
    FreeCAD.Console.PrintMessage("Exported STL to %s\n" % stl_path)
else:
    FreeCAD.Console.PrintMessage("No pads created - check your SVG contains closed paths.\n")
