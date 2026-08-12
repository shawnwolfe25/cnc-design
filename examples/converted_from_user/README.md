Converted user image examples

Files added:
- examples/converted_from_user/AMVETS_traced.svg
  - A simplified, first-pass vectorization of your uploaded logo. Open in Inkscape and refine nodes, assign shapes to 'cut' or 'engrave' layers, and convert text to paths (Path -> Object to Path) for reliable CAM behavior.

- examples/converted_from_user/AMVETS_extruded.stl
  - A very simple, low-detail extruded STL representing a plate with a raised center emblem and a raised text block. This is only for testing import and toolpath generation.

- tools/trace_with_potrace.sh
  - Command-line trace pipeline using ImageMagick + potrace. Run locally to generate a higher-quality traced SVG from your PNG.

- tools/inkscape_trace.sh
  - Helper wrapper to produce a clean SVG and prompt you to run Trace Bitmap in Inkscape for best results.

- tools/freecad_extrude_macro.py
  - FreeCAD macro to import a clean SVG, extrude shapes (pad), and export an STL. Run in FreeCAD.

- tools/run_full_conversion.sh
  - A wrapper that traces with potrace and writes instructions for running the FreeCAD macro (the FreeCAD step is interactive).

Notes and recommended next steps
1. Download your PNG from this chat and save as a file (e.g., amvets.png). If you prefer, I can also add the original PNG base64 file into the repo if you confirm.
2. Run: ./tools/trace_with_potrace.sh amvets.png examples/converted_from_user/amvets_auto.svg
3. Open the generated SVG in Inkscape, clean paths, convert text to paths, create layers 'cut' and 'engrave', then save as Plain SVG.
4. To make a 3D extrusion, open FreeCAD, run the macro tools/freecad_extrude_macro.py, provide the SVG path, set thickness, and export STL.

If you want me to: I can also (pick any or multiple):
- Add the original PNG (base64) into the repo so you can decode it directly here. Reply "add png".
- Attempt a higher-quality manual trace for you here (I will produce a more detailed SVG trace). Reply "manual trace".
- Create a FreeCAD document (.FCStd) with the SVG imported and extruded so you can inspect layers—reply "add freecad file".
