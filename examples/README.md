Examples for image → SVG → STL workflow

Files included:
- examples/picture_input/sample_image_base64.txt
  - A tiny example PNG image encoded in base64. To decode it to sample_image.png run:
    base64 -d examples/picture_input/sample_image_base64.txt > examples/picture_input/sample_image.png

- examples/generated_svg/sample_traced.svg
  - An example traced SVG (a simple star) placed in the `cut` group. Open in Inkscape and follow the docs/image_to_svg_and_3d.md steps to edit and export.

- examples/generated_stl/sample_relief.stl
  - A tiny ASCII STL representing a flat square with a small pyramid relief. Import into FreeCAD or your CAM to test importing meshes and creating toolpaths.

How to use these files:
1. Decode the sample PNG (see command above) and open it in Inkscape: File → Import.
2. Trace the bitmap (Path → Trace Bitmap) to create a vector, then clean and place in `cut`/`engrave` layers.
3. Use the traced SVG (or the provided sample_traced.svg) in FreeCAD: File → Import → Extrude or use Path workbench to create toolpaths.
4. For the STL, open FreeCAD and File → Import → examples/generated_stl/sample_relief.stl and practice generating paths (clearance + finish) in the Path workbench.

If you want, I can add a small script to automate the SVG trace in Inkscape's command-line and an automated FreeCAD macro to extrude and create a basic toolpath.
