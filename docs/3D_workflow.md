# 3D Workflow (Free / Hobbyist options)

This document shows simple, free or hobbyist-friendly ways to design in 3D and produce G-code for your Shapeoko without buying expensive software.

Top recommended toolchains
1. FreeCAD (free, open-source)
   - Use Sketcher and Part/Part Design to build parametric 3D parts.
   - Use the Path workbench to generate 2.5D/3D toolpaths and export G-code (GRBL/Carbide Motion post-processor).
2. Fusion 360 (free for hobbyists/startups)
   - Integrated CAD + CAM; good adaptive clearing and 3D toolpaths.
3. OpenSCAD (free)
   - Programmatic modeling; export STL and create toolpaths in FreeCAD or Fusion.
4. Blender + BlenderCAM (free, advanced)
   - For sculpted/organic shapes; steeper learning curve.

Quick FreeCAD example (SVG → extrude → Path)
1. Install FreeCAD (stable release).
2. File → Import → select your SVG. The imported geometry appears in the Draft/Sketch workbench.
3. Adjust scale/position, convert to a sketch if needed, then switch to Part or Part Design and extrude (Pad) to the desired thickness.
4. Switch to the Path workbench. Create a Setup (define stock size and origin — set to your Shapeoko work zero).
5. Add operations (profile, pocket, adaptive clearing). Set conservative feeds & depths.
6. Export G-code using a GRBL or Carbide Motion post-processor.
7. Do an air-cut first and verify.

Converting 2D designs to 3D
- Extrude: Pad an SVG outline to a thickness to make 3D plates/brackets.
- Reliefs: Convert an SVG to a heightmap (grayscale), import to Blender or FreeCAD, create a mesh and toolpath for carving.
- Parametric code: Use OpenSCAD for programmatic parts, export STL, and CAM in FreeCAD.

Post-processing & streaming
- Use Carbide Motion or gSender to stream G-code to your Shapeoko (both support GRBL-based controllers).
- bCNC is useful for probing, file editing, and running jobs; gSender offers a modern UI for Shapeoko.

Links & resources
- FreeCAD: https://www.freecad.org/
- Fusion 360 for personal use: https://www.autodesk.com/products/fusion-360/personal
- OpenSCAD: https://openscad.org/
