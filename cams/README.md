# CAM notes for Shapeoko (SVG → toolpath)

Recommended CAM apps:
- Carbide Create (free; good for Shapeoko users)
- Easel (web-based)
- Fusion 360 (free for hobbyists; more advanced)
- VCarve (paid; professional)

SVG import tips
- Use paths (not strokes) for cut outlines when possible. If you export strokes, tell your CAM to treat them as centerline or set the stroke width to the tool diameter.
- Create two groups/layers named `cut` and `engrave`. Set cut paths to be used as through-cuts, engraving paths as shallow passes.

Origin & coordinate tips
- Decide work zero (usually lower-left or center). Place the origin marker in the SVG or position the part in CAM.
- For repeatability, draw an alignment notch or hole at the origin position.

Conservative starting feeds & depths (wood) — verify and tune
- Bit: 1/4" upcut endmill, sharp & clean.
- Spindle speed: 12,000–18,000 RPM (check your router).
- Feedrate: 40–100 in/min for softwoods; 30–60 in/min for hardwoods (start low).
- Depth per pass: 1/8" (0.125") to 1/4" (0.25") per pass depending on hardwood & rigidity.
- Plunge rate: 10–30 in/min (slow plunges).

Safety
- Always do an air-cut (no spindle) first to confirm motion and clearances.
- Clamp workpiece securely; use sacrificial spoilboard when needed.
- Keep RPM, feedrate, pass depth conservative on first cuts; adjust after testing.
