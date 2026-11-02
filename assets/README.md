# Profile artwork

`pixel-workspace.png` is original artwork generated with the built-in image generation tool. The current profile cover is `pixel-workspace-motion.gif`: a 12-second, 144-frame loop in which the person types, reaches for coffee, lifts and drinks it, puts it down, and turns to the window. Ambient motion includes rising steam, workflow packets on the monitor, drifting window dust, sunset reflections, and a breathing lamp glow.

The six character keyframes in `poses/` were edited with the built-in image generation tool; their exact prompts are in [poses/PROMPTS.md](poses/PROMPTS.md). `cover-animation.html` composites only a fixed actor area so the room stays stable. It is both the live preview and the deterministic frame renderer.

## Rebuild

From the repository root, start `python3 -m http.server 8767 --bind 127.0.0.1`. Open `http://127.0.0.1:8767/assets/cover-animation.html` to preview. With Ego Lite installed, export frames using `ego-browser nodejs < assets/export-cover.mjs`, then pass its printed temporary directory to `bash assets/animate-cover.sh /absolute/path/to/frame-directory` (FFmpeg required).

`pixel-workspace.gif` is the earlier six-second ambient-only version, retained for comparison. The profile now points to the new filename so browsers can fetch the updated animation immediately.

## Generation prompt

```
Use case: stylized-concept. Asset type: original pixel-art GitHub profile cover, wide 2:1 landscape composition 1536x768. Primary request: a cozy creative technologist's studio in warm apricot, terracotta orange, sage green and dark warm brown, crisp elegant 2D pixel art. Side-on cutaway room: anonymous person viewed from behind seated at a wooden desk with two monitors showing tiny abstract product wireframes and workflow blocks, no legible text. Warm desk lamp at center right with visible small light bulb. Wide window at left with peach sunset sky and distant city, bookshelf at right, camera on shelf, basketball on floor, a leafy plant, a mug on the desk. Screen surfaces and lamp clearly visible for later cursor blinking and light animation. Balanced uncluttered professional GitHub banner with detailed pixel textures, cozy amber lighting and restrained sage accents. Use recognizable square pixels and flat stepped shadows, not blurry photorealism. Full bleed artwork, no borders. No logos, no text, no watermark, no known anime/game characters, no blue/purple neon palette, no real person's portrait.
```

## Technology icons

`tech-stack.svg` was downloaded from [Skill Icons](https://github.com/tandpfun/skill-icons), using the React, TypeScript, JavaScript, Python, FastAPI, PostgreSQL, Docker and Git icons with the dark theme. Its MIT license is included in `skill-icons-LICENSE`.
