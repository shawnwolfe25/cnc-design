# CNC Design — Shapeoko Workflow

A collection of templates, guides, and tools for converting images and designs into G-code for your **Shapeoko** CNC machine. Start with an image or sketch, trace it to vectors, optionally extrude to 3D, and generate toolpaths.

## 🚀 Quick start

**I have an image or logo** → [Go to Section A: Make a 2D SVG](#a-make-a-2d-svg-best-for-logos-simple-shapes-or-outlines)

**I want to make a 3D relief or raised part** → [Go to 3D Workflow](/docs/3D_workflow.md)

**I'm ready to cut and need safe settings** → [Go to Best Practices](/docs/best-practices.md)

---

## What's inside

| Folder | Purpose |
|--------|---------|
| **`/templates`** | Ready-to-use SVG templates (inches) |
| **`/designs`** | Design examples and test files |
| **`/docs`** | Step-by-step guides (image→SVG→3D, best practices) |
| **`/examples`** | Sample files and conversion walkthroughs |
| **`/cams`** | Shapeoko feeds, speeds, and CAM app tips |
| **`/tools`** | Scripts to automate conversion pipeline |

---

## 📖 Key documentation

### For beginners
- **[Image to SVG and 3D](/docs/image_to_svg_and_3d.md)** — Complete step-by-step for converting photos/logos to vectors or 3D reliefs
- **[Best Practices & Checklist](/docs/best-practices.md)** — Pre-cut safety and conservative starting settings

### For CAM users
- **[3D Workflow](/docs/3D_workflow.md)** — Design in FreeCAD or Fusion 360, export G-code
- **[CAM Notes](/cams/README.md)** — Recommended feeds, speeds, and CAM apps for Shapeoko

---

## A. Make a 2D SVG (best for logos, simple shapes, or outlines)

### Step 1: Prepare the image
- Use a high-contrast image (logos or black-and-white drawings work best)
- If it's a photo, edit in GIMP to increase contrast and remove background

### Step 2: Trace in Inkscape (free)
1. Open Inkscape and set units to **inches**: File → Document Properties → Units → inches
2. File → Import your PNG/JPG
3. Select the image → Path → **Trace Bitmap**
   - Black/white logo: use "Brightness cutoff" (~0.45–0.55)
   - Silhouette: try "Edge detection" or "Multiple scans"
4. Move traced vector aside and delete the original image

### Step 3: Clean up
- Ungroup (Object → Ungroup) and remove tiny shapes
- Path → Simplify (Ctrl+L) to reduce complexity
- Path → Union to merge shapes; Path → Difference to cut holes

### Step 4: Organize for CAM
- Create two layers: `cut` and `engrave` (Layers → Add Layer)
- Put outlines to cut into `cut` layer (closed paths)
- Put details/lines into `engrave` layer
- Convert strokes to paths: Path → Stroke to Path

### Step 5: Scale and save
- Resize to real-world inches using the toolbar
- Set origin (0,0) at lower-left or center as needed
- **File → Save As → Plain SVG** (most compatible with CAM)

**Next:** Import into [Carbide Create](https://carbide3d.com/carbidecreate/), Fusion 360, or FreeCAD to generate toolpaths.

---

## B. Make a 3D relief (carve a picture as shallow 3D shape)

Two paths:

### Option 1: Extrude the SVG into a 3D object
1. Import clean SVG into FreeCAD (free)
2. Use Part → Extrude (Pad) to give thickness
3. Switch to Path workbench → Create Setup → Add operations → Export G-code

**Full guide:** [3D Workflow](/docs/3D_workflow.md)

### Option 2: Make a grayscale heightmap relief
1. Convert photo to grayscale in GIMP (Colors → Desaturate)
2. Import into Blender, add a Plane, subdivide heavily
3. Add Displace modifier with grayscale image
4. Export STL
5. Generate toolpaths in FreeCAD or Fusion

**Full guide:** [Image to SVG and 3D](/docs/image_to_svg_and_3d.md) → Section B

---

## 🛠️ Tools included

- **`trace_with_potrace.sh`** — Batch PNG → SVG using ImageMagick + potrace
- **`inkscape_trace.sh`** — Inkscape tracing helper
- **`freecad_extrude_macro.py`** — FreeCAD macro: SVG → extrude → STL
- **`run_full_conversion.sh`** — Full pipeline (trace + extrude)

**Usage:** See comments in each script or run with `--help`.

---

## 📁 Examples

### Sample files to test the workflow
- **`examples/picture_input/sample_image_base64.txt`** — Tiny PNG (base64; decode to test)
  ```bash
  base64 -d examples/picture_input/sample_image_base64.txt > sample.png
  ```
- **`examples/generated_svg/sample_traced.svg`** — Example traced SVG
- **`examples/generated_stl/sample_relief.stl`** — Example STL for toolpath testing
- **`examples/3d_examples/parametric_box.scad`** — OpenSCAD parametric design

### Real-world conversions
- **`examples/converted_from_user/AMVETS_traced.svg`** — Logo → traced vector
- **`examples/converted_from_user/AMVETS_extruded.stl`** — Logo → 3D relief STL

---

## ⚡ Before your first cut

**Safety checklist** (from [Best Practices](/docs/best-practices.md)):
- ✓ Verify file is loaded and units are inches
- ✓ Confirm work zero / origin
- ✓ **Do an air-cut first** (dry run, no spindle)
- ✓ Clamp workpiece; use sacrificial spoilboard for through-cuts
- ✓ Wear PPE (glasses, hearing protection)

**Conservative Shapeoko settings** (wood, 1/4" bit):
- Bit: 1/4" upcut endmill
- Spindle: 12k–18k RPM
- Feed: 40–80 in/min (softwood) / 30–60 in/min (hardwood)
- Depth per pass: 0.125"–0.25"
- Plunge: 15–25 in/min

**See [CAM Notes](/cams/README.md) for full guidance.**

---

## 📋 Repository info

**Target machine:** Shapeoko (GRBL / Carbide Motion)  
**Work area:** 48" × 48"  
**Max material thickness:** ~3"  
**Primary format:** SVG (layered for cut vs engrave)  
**3D files:** FreeCAD (.FCStd), STL  

---

## 🤝 Contributing

Have a design, template, or workflow improvement?

- **Add files locally** and push a PR with a short description
- **Request conversions** — reply in this repo and I'll add the output and update the changelog

---

## 📝 Recent updates

- **2026-08-12** — Added starter files, 3D workflow docs, example traces, and conversion tools
- **2026-08-12** — Added AMVETS logo conversion (PNG → traced SVG → extruded STL)

---

## 📚 Quick reference

| I want to... | Read this |
|-------------|-----------|
| Convert a photo to SVG | [Image to SVG and 3D](/docs/image_to_svg_and_3d.md) → Section A |
| Make a 3D carving from a photo | [Image to SVG and 3D](/docs/image_to_svg_and_3d.md) → Section B |
| Design in 3D and make G-code | [3D Workflow](/docs/3D_workflow.md) |
| Get safe Shapeoko settings | [CAM Notes](/cams/README.md) |
| See a pre-cut checklist | [Best Practices](/docs/best-practices.md) |
| Use example files | [Examples](/examples/README.md) |

---

## 📦 Requirements

- **Inkscape** (free) — image tracing and SVG editing
- **FreeCAD** (free) — 3D modeling and CAM toolpath generation
- **Blender** (free, optional) — for photo reliefs and sculpted shapes
- **Your CAM app** — Carbide Create (free), Fusion 360 (free for hobbyists), or other

---

## 📄 License

MIT — Feel free to use and modify for personal or commercial projects.

---

**Questions?** Open an [issue](https://github.com/shawnwolfe25/cnc-design/issues) or check the docs.

Happy cutting! ✂️🪚
