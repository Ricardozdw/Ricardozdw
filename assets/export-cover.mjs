// Run through `ego-browser nodejs` after starting a local HTTP server on 8767.
// All output is temporary; the repository stores only source art and the GIF.
const fs=await import('node:fs/promises');
const path=await import('node:path');
const os=await import('node:os');
const output=await fs.mkdtemp(path.join(os.tmpdir(),'ricardozdw-cover-'));
const task=await taskSpace('Pixel cover export');
const page=task.page('p1');
await page.goto('http://127.0.0.1:8767/assets/cover-animation.html');
await page.waitForFunction(()=>window.animationReady,undefined,{timeout:15000});
await page.evaluate(()=>pauseAnimation());
for(let frame=0;frame<144;frame++){
  const png=await page.evaluate(t=>{renderFrame(t);return document.querySelector('canvas').toDataURL('image/png').split(',')[1]},frame/12);
  await fs.writeFile(path.join(output,`frame-${String(frame).padStart(3,'0')}.png`),Buffer.from(png,'base64'));
}
console.log({frames:144,duration:12,directory:output});
await task.finish({keep:[]});
