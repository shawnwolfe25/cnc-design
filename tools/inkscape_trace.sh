#!/bin/bash
# Inkscape batch trace wrapper (alternative if you have Inkscape 1.x)
# Requires Inkscape 1.0+ with --batch-process support and a trace extension
# Usage: ./tools/inkscape_trace.sh input.png output.svg

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.png output.svg"
  exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Convert to a high-contrast PNG first
convert "$INPUT" -colorspace Gray -contrast-stretch 0.5% -resize 2000x2000\> /tmp/trace_temp.png

# Inkscape --batch-process with a tracing step using command line verbs is not guaranteed across versions
# This script opens Inkscape GUIless and runs a trace via command if available
inkscape /tmp/trace_temp.png --export-plain-svg="$OUTPUT"

echo "Exported plain SVG. Open $OUTPUT in Inkscape and use Path -> Trace Bitmap to create a traced vector."
