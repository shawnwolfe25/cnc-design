# CNC Designs — Shapeoko / SVG Starter

This repository is a starter kit for Shapeoko-style CNC work focused on 2D wood projects (SVG-first). It includes sheet templates, example parts, and Shapeoko/CAM guidance.

Quick facts
- Target machine: Shapeoko (GRBL / Carbide Motion workflows)
- Work area: 48" × 48" (4' × 4")
- Max material thickness: ~3"
- Primary file format: SVG (layered for cut vs engrave)

Contents
- designs/ : SVG templates and example parts
- cams/ : CAM tips and post-processing guidance for Shapeoko
- templates/ : sheet/stock templates sized in inches
- docs/ : quick 3D workflow, best practices, and examples
- examples/3d_examples : small OpenSCAD example (inches)

Workflow (recommended)
1. Create or edit SVG in Inkscape / Illustrator / Affinity Designer.
2. Use layers or groups named `cut` (paths to be cut) and `engrave` (lines/fills for engraving).
3. Import SVG into Carbide Create / Easel / Fusion 360 (SVG import).
4. Set tool sizes, depths per pass, and generate toolpaths.
5. Post-process for your controller (GRBL / Carbide Motion).
6. Dry-run (air cut) and verify origin/work zero before cutting material.

Safety & verification
- Always clamp stock securely and confirm correct origin.
- Start with shallow test cuts and small feedrates; verify tool and bit condition.
- Consult bit manufacturer and materials reference for feeds & speeds — the CAM notes include conservative starting values.

License: MIT
