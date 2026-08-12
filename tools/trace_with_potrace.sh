# Auto-trace script using ImageMagick + Potrace

# Requirements: ImageMagick (convert) and potrace
# Usage: ./tools/trace_with_potrace.sh input.png output.svg

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.png output.svg"
  exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Convert to a clean PBM bitmap suitable for potrace
# -resize can be adjusted for resolution
convert "$INPUT" -colorspace Gray -threshold 50% -resize 2000x2000\> -negate -threshold 10% -type bilevel pbm:- | potrace -s -o "$OUTPUT"

echo "Traced SVG written to $OUTPUT (use Inkscape to clean up and place paths into 'cut'/'engrave' layers)."
