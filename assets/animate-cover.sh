#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# Input: 144 PNG frames exported from cover-animation.html at 12 fps.
frames="${1:?Pass the frame directory printed by export-cover.mjs}"
ffmpeg -hide_banner -loglevel error -y \
  -framerate 12 -i "$frames/frame-%03d.png" \
  -filter_complex "
    [0:v]split[scene][colors];
    [colors]palettegen=max_colors=256:stats_mode=full[palette];
    [scene][palette]paletteuse=dither=bayer:bayer_scale=3:diff_mode=rectangle[out]
  " -map '[out]' -loop 0 pixel-workspace-motion.gif
