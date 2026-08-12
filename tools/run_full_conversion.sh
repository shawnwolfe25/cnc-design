#!/bin/bash
# wrapper: trace image, import into FreeCAD via macro, export STL
# Usage: ./tools/run_full_conversion.sh input.png out.svg out.stl

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 input.png out.svg out.stl"
  exit 1
fi

INPUT="$1"
OUT_SVG="$2"
OUT_STL="$3"

# Step 1: trace with potrace pipeline
mkdir -p /tmp/cnc_trace
convert "$INPUT" -colorspace Gray -threshold 50% -resize 2000x2000\> -negate -threshold 10% -type bilevel /tmp/cnc_trace/temp.pbm
potrace -s -o "$OUT_SVG" /tmp/cnc_trace/temp.pbm

# Step 2: run FreeCAD macro to extrude and export STL (non-headless - user must run macro in FreeCAD)
# This step cannot be fully headless easily across platforms. Instead, write a small macro instruction file.
cat > /tmp/cnc_trace/freecad_instructions.txt <<EOF
Open FreeCAD, run Macro -> Execute -> select tools/freecad_extrude_macro.py
When prompted, provide: $OUT_SVG and then $OUT_STL (output path)
EOF

echo "Trace complete: $OUT_SVG"
echo "To finish STL export, open FreeCAD and run the macro tools/freecad_extrude_macro.py"

echo "Instructions written to /tmp/cnc_trace/freecad_instructions.txt"
