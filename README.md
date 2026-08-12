# CNC Designs — Shapeoko / SVG Starter

This repository is a starter kit for Shapeoko-style CNC work focused on 2D wood projects (SVG-first) and a simple path to create 3D reliefs. It contains templates, example files, conversion tools, and guides so you can take an image, turn it into a CNC-ready SVG, extrude it to 3D, and generate toolpaths.

Quick facts
- Target machine: Shapeoko (GRBL / Carbide Motion workflows)
- Work area: 48" × 48" (4' × 4")
- Max material thickness: ~3" (your sled supports up to 3")
- Primary file format: SVG (layered for cut vs engrave)
- 3D files: FreeCAD (.FCStd) and STL exported from FreeCAD

Repository layout (important folders)
- designs/ — sheet templates and simple example SVGs (48x48 template, parts_plate.svg)
- cams/ — CAM notes and conservative starting feeds & speeds for wood
- docs/ — step-by-step guides (3D workflow, image→SVG→3D guide)
- examples/ — example inputs and auto/manual converted outputs
  - examples/converted_from_user/ — files created from the images you supplied
  - examples/generated_svg/ and examples/generated_stl/ — automated examples
- examples/converted_from_user/AMVETS_original.png — original image you uploaded
- tools/ — helper scripts and FreeCAD macro to automate tracing and extruding
- templates/ — stock/sheet templates in inches

Recent updates (auto-maintained)
- 2026-08-12: Added starter files and 3D workflow docs.
- 2026-08-12: Added example auto-trace files and small sample SVG/STL to demonstrate pipeline.
- 2026-08-12: Added tools: trace_with_potrace.sh, inkscape_trace.sh, freecad_extrude_macro.py, run_full_conversion.sh.
- 2026-08-12: Added your uploaded logo and performed manual trace and FreeCAD extrusion to 0.75" (3/4"):
  - examples/converted_from_user/AMVETS_original.png
  - examples/converted_from_user/AMVETS_manual_trace.svg  (cut & engrave layers, text converted to paths)
  - examples/converted_from_user/AMVETS_extruded.FCStd
  - examples/converted_from_user/AMVETS_extruded.stl

How I will keep README up to date
- I will update this Recent updates list each time I add or modify files in the repo (commits that add examples, tools, or outputs).
- If you or collaborators add files, please append a short note under Recent updates or open a PR and request I add the note.
- For transparency I include the date (YYYY-MM-DD), a one-line summary, and a list of new/changed files.

How to contribute or request changes
- Want me to add files or run conversions? Reply in this chat with what you want (example: "manual trace and G-code for part X"). I will commit the files and add an entry to Recent updates.
- To make local changes: clone the repo, edit files, and push — then either open a PR or tell me and I'll add the change-note to Recent updates.

Quick start (three steps to go from image → CNC)
1. Place your image in examples/picture_input/ or examples/converted_from_user/ (we already added your image).
2. Run the trace script (tools/trace_with_potrace.sh) or use Inkscape to trace the bitmap. Clean up paths and place cut outlines in a layer called `cut` and engraving/lines in `engrave`.
3. Import the cleaned SVG into FreeCAD (or your CAM), extrude as needed, export an STL, and generate G-code in your CAM. Always do an air-cut first.

Contact me here in the repo chat whenever you want a conversion or a G-code file generated and I will update this README with the change and commit the outputs.
