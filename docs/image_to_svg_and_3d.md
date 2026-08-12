# Convert a Picture to SVG and Make a 3D Part — Step-by-step (easy)

This guide shows two simple workflows you can do with free tools:

A) Turn a picture (photo or logo) into a clean SVG for cutting or engraving (2D).
B) Turn a picture into a 3D relief you can carve (3D). 

I wrote this so you can add a picture file, convert it, and get something your Shapeoko can use.

— Quick summary (what you'll do)
1. Pick a clear image (higher contrast = easier).
2. Convert image to vectors (SVG) using Inkscape (free).
3. Clean the SVG and place vector paths into `cut` or `engrave` groups.
4. (Optional) Extrude the SVG into a 3D object in FreeCAD or make a heightmap in Blender to get a relief.
5. Use your CAM (Carbide Create, Fusion, FreeCAD Path) to make toolpaths and export G-code.

A. Make a 2D SVG (best for logos, simple shapes, or outlines)

1) Prepare the image
- Use a simple, high-contrast image. Logos or black-and-white drawings work best.
- If it's a photo, edit it first to increase contrast and remove background (use GIMP or an online editor).

2) Open and trace in Inkscape (free)
- Open Inkscape and set the document units to inches: File → Document Properties → Units → inches.
- File → Import and choose your picture (PNG/JPG).
- Select the image, then go to Path → Trace Bitmap.
  - For a black/white logo: use "Brightness cutoff" with a threshold around 0.45–0.55.
  - For a silhouette: try "Edge detection" or "Multiple scans" for colors.
  - Click "Update" to preview, then OK to create the vector result.
- Move the vector result aside and delete the original raster image.

3) Clean up the vector
- Ungroup (Object → Ungroup) and remove tiny shapes or noise.
- Path → Simplify (Ctrl+L) reduces points if the shape is too complex. Don’t overdo it.
- If you need a single outline for cutting, use Path → Union to merge shapes, or Path → Difference to cut holes.

4) Prepare layers for CAM
- Create two layers named exactly: `cut` and `engrave` (Layers → Add Layer).
- Put outlines you want to fully cut into `cut` (closed paths). Put line-work or shallow details into `engrave`.
- Make sure the stroke is converted to a path if your CAM expects fills: Path → Stroke to Path.

5) Scale and position
- Set the object size in the toolbar or using Transform so it matches the real world size (inches).
- Place the origin: if you want the lower-left of the sheet to be (0,0), move the artwork there or use an alignment notch at (0,0).

6) Save as Plain SVG
- File → Save As → Plain SVG. This is the most compatible SVG for CAM tools.

Notes for CAM: If your tool treats strokes as centerlines, set stroke width to tool diameter (not recommended). Better: use filled paths so CAM uses them as outlines.

B. Make a 3D relief (carve a picture as a shallow 3D shape)

There are two common ways: (1) Extrude the vector (simple 3D part), (2) Make a grayscale heightmap and carve a relief.

Option 1 — Extrude the SVG into a 3D object (for plates, signs, brackets)
1) Import SVG into FreeCAD
- Open FreeCAD (free). Workbench: "Part" or "Part Design".
- File → Import → select your saved SVG.
- In the Draft or Part workbench, use Draft → Upgrade or convert to a sketch, or select the imported shapes and use Part → Extrude (Pad) to give thickness.
- Set thickness (e.g., 0.5" for a sign) and export the model as STL if needed.

2) Make toolpaths in FreeCAD
- Switch to Path workbench. Create a new Setup (set stock size and origin to match your Shapeoko setup).
- Add operations: profiling for outlines, pockets for cutouts, and engraving for shallow details.
- Export G-code using a GRBL/Carbide Motion post-processor.

Option 2 — Turn the picture into a heightmap and carve a relief (best for photos or shaded art)
1) Make a grayscale heightmap
- Open the picture in GIMP (free). Convert to grayscale: Colors → Desaturate.
- Adjust brightness/contrast so the important parts have clear tones (Colors → Brightness-Contrast or Levels).
- Save as PNG with no alpha channel (grayscale PNG).

2) Import heightmap in Blender and make a 3D mesh
- Open Blender (free). Delete the default cube.
- Add a Plane: Add → Mesh → Plane.
- With the plane selected, go to Edit Mode and Subdivide many times (right sidebar → Subdivide → set number of cuts high, e.g., 200–400 depending on resolution). More cuts = higher detail but heavier file.
- Go back to Object Mode. Add a Displace modifier (Modifiers tab) and create a new Texture for it; click the texture icon to open the Texture properties and load your grayscale PNG as the Image Texture.
- In the Displace modifier, set Strength to the maximum desired depth (e.g., 0.1" to 0.25" for relief). You may need to scale the plane so units are in inches.
- Apply the modifier (Object → Apply → Visual Geometry to Mesh).
- Export the mesh as STL: File → Export → STL.

3) Generate toolpaths
- Import the STL into FreeCAD (Part → Import) or Fusion 360.
- In FreeCAD Path workbench, use clearing and finishing toolpaths appropriate for relief carving (adaptive clearing, horizontal/parallel finishing). Use conservative feeds/depths for wood.
- Export G-code (GRBL/Carbide Motion).

C. Quick tips and troubleshooting
- If your SVG has thousands of points, your CAM may slow or crash. Simplify paths where possible.
- For engraved detail, use darker/lighter regions of the heightmap to control depth. Test on scrap wood first.
- Use a sacrificial backer board to avoid blowout on through cuts.
- If your machine uses inches, always check units in Inkscape/FreeCAD before exporting.

D. Example workflow I can add to the repo (I will add this file now if you want)
- /docs/image_to_svg_and_3d.md — this step-by-step guide (what you're reading).
- /examples/picture_input/ — a sample PNG you can try.
- /examples/generated_svg/ — the traced SVG from that PNG for testing.
- /examples/generated_stl/ — an exported STL of a relief so you can test toolpaths.

What I did just now
- I can add this guide file into your repo and also add example files (PNG, traced SVG, and example STL). Tell me if you want the sample files added.

What I suggest next
- If you'd like, say "Add examples" and I will push the guide plus a sample PNG and its traced SVG and a sample STL to your repo so you can try the whole flow.
- If you want a simpler test, tell me a logo or picture (attach or give a link) and I’ll convert it to an SVG and add it to the repo.

Which do you want: just the guide, or the guide plus example files (PNG→SVG→STL)?