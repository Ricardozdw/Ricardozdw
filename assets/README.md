# Profile artwork

The current profile cover is `pixel-workspace-daylight.gif`: a 12-second, 144-frame loop in a clear sunny daytime studio. The person types, reaches for coffee, lifts and drinks it, puts it down, then resumes typing. There is no looking-out-the-window pose. The palette is ivory, sky blue and teal with subtle yellow accents. Ambient motion includes rising steam, workflow packets on the monitor, drifting window dust, water reflections, and a restrained lamp glow.

The current base scene and five character keyframes in `daylight/` were edited with the built-in image generation tool; their exact prompts are in [daylight/PROMPTS.md](daylight/PROMPTS.md). `cover-animation.html` composites only a fixed actor area so the room stays stable. It is both the live preview and the deterministic frame renderer.

## Rebuild

From the repository root, start `python3 -m http.server 8767 --bind 127.0.0.1`. Open `http://127.0.0.1:8767/assets/cover-animation.html` to preview. With Ego Lite installed, export frames using `ego-browser nodejs < assets/export-cover.mjs`, then pass its printed temporary directory to `bash assets/animate-cover.sh /absolute/path/to/frame-directory` (FFmpeg required).

`pixel-workspace.png`, `poses/`, `pixel-workspace.gif` and `pixel-workspace-motion.gif` are earlier warm sunset source art and animations, retained for comparison. The profile points to the new daylight filename so browsers can fetch the current animation immediately.

## Original sunset generation prompt (archived)

```
Use case: stylized-concept. Asset type: original pixel-art GitHub profile cover, wide 2:1 landscape composition 1536x768. Primary request: a cozy creative technologist's studio in warm apricot, terracotta orange, sage green and dark warm brown, crisp elegant 2D pixel art. Side-on cutaway room: anonymous person viewed from behind seated at a wooden desk with two monitors showing tiny abstract product wireframes and workflow blocks, no legible text. Warm desk lamp at center right with visible small light bulb. Wide window at left with peach sunset sky and distant city, bookshelf at right, camera on shelf, basketball on floor, a leafy plant, a mug on the desk. Screen surfaces and lamp clearly visible for later cursor blinking and light animation. Balanced uncluttered professional GitHub banner with detailed pixel textures, cozy amber lighting and restrained sage accents. Use recognizable square pixels and flat stepped shadows, not blurry photorealism. Full bleed artwork, no borders. No logos, no text, no watermark, no known anime/game characters, no blue/purple neon palette, no real person's portrait.
```

## Technology icons

`tech-stack.svg` was downloaded from [Skill Icons](https://github.com/tandpfun/skill-icons), using the React, TypeScript, JavaScript, Python, FastAPI, PostgreSQL, Docker and Git icons with the dark theme. Its MIT license is included in `skill-icons-LICENSE`.
