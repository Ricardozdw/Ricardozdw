#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# The original scene stays fixed; only the cursor, bulb and sunset glints move.
ffmpeg -hide_banner -loglevel error -y \
  -loop 1 -framerate 12 -t 6 -i pixel-workspace.png \
  -filter_complex "
    [0:v]drawbox=x=976:y=410:w=6:h=11:color=0xffd6a0@0.9:t=fill:enable='lt(mod(t,1),0.5)',
    drawbox=x=1255:y=365:w=5:h=17:color=0xffedb1@0.28:t=fill:enable='between(mod(t,3),0.5,2.5)',
    drawbox=x=1255:y=365:w=5:h=17:color=0xfff7d7@0.42:t=fill:enable='between(mod(t,3),1,2)',
    drawbox=x=1255:y=365:w=5:h=17:color=0xfffbee@0.45:t=fill:enable='between(mod(t,3),1.25,1.75)',
    drawbox=x=352:y=399:w=13:h=2:color=0xffd58e@0.65:t=fill:enable='between(mod(t,2),0,0.75)',
    drawbox=x=368:y=407:w=9:h=2:color=0xffd58e@0.65:t=fill:enable='between(mod(t,2),0.5,1.25)',
    drawbox=x=340:y=415:w=15:h=2:color=0xffd58e@0.65:t=fill:enable='between(mod(t,2),1,1.75)',
    scale=1200:600:flags=neighbor,split[scene][colors];
    [colors]palettegen=max_colors=256:stats_mode=full[palette];
    [scene][palette]paletteuse=dither=bayer:bayer_scale=3:diff_mode=rectangle[out]
  " -map '[out]' -loop 0 pixel-workspace.gif
