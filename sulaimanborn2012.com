<!doctype html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Overstim</title>
<meta name="claude:viewport-fit-sides" content="cover">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,500..800&family=DM+Sans:wght@400;500;700&family=DM+Mono:wght@400;500&display=swap">
<style>
/* Layout: one column on phones. From 980px a main column (click zone, then a grid of distraction windows) sits beside a sticky upgrade shop. The windows are the loud part; everything around them stays quiet. Single committed dark look: overstimulation happens on a screen at night. */
:root{
  --bg:#10121f; --surface:#181b2e; --surface-2:#212543; --well:#12142a; --line:#2d3257;
  --fg:#eef0ff; --muted:#a2a8d4;
  --pink:#ff4fa3; --pink-deep:#b81f6c; --yellow:#ffd84a; --cyan:#3de0ff; --lime:#8dff6a; --orange:#ff8a3d; --violet:#9b7bff;
  --font-display:'Bricolage Grotesque','Arial Black',system-ui,sans-serif;
  --font-body:'DM Sans',system-ui,-apple-system,'Segoe UI',sans-serif;
  --font-mono:'DM Mono',ui-monospace,Menlo,Consolas,monospace;
  --heat:0;
  color-scheme:dark;
}
*{box-sizing:border-box}
html{background:var(--bg)}
body{
  background:var(--bg);color:var(--fg);font:15px/1.45 var(--font-body);
  padding-block:20px 40px;
  padding-left:max(16px,env(safe-area-inset-left,0px));
  padding-right:max(16px,env(safe-area-inset-right,0px));
}
button{font:inherit;color:inherit;cursor:pointer}
h1,h2{margin:0;font-family:var(--font-display)}
:focus-visible{outline:3px solid var(--cyan);outline-offset:2px}
.wrap{max-width:1180px;margin:0 auto;display:grid;gap:16px}

/* header */
.top{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:12px 24px}
.brand{display:flex;align-items:center;gap:10px}
.logo{width:28px;height:28px;border-radius:50%;background:conic-gradient(var(--pink),var(--yellow),var(--lime),var(--cyan),var(--violet),var(--pink))}
h1{font-size:28px;font-weight:800;letter-spacing:-.02em}
.status{display:flex;align-items:center;gap:6px 12px;flex-wrap:wrap;min-width:0}
.chip{font:500 12px var(--font-mono);text-transform:uppercase;letter-spacing:.08em;padding:5px 10px;border-radius:99px;background:var(--surface-2);border:1px solid var(--line);color:var(--lime)}
.meter{width:150px;height:8px;border-radius:99px;background:var(--surface-2);overflow:hidden}
.meter i{display:block;height:100%;width:0;background:linear-gradient(90deg,var(--cyan),var(--pink));border-radius:inherit;transition:width .3s}
.next{font:12px var(--font-mono);color:var(--muted)}

/* layout */
.layout{display:grid;gap:16px;grid-template-columns:minmax(0,1fr)}
.main{display:grid;gap:16px;min-width:0}
@media (min-width:980px){
  .layout{grid-template-columns:minmax(0,1fr) 360px;align-items:start}
  .shop{position:sticky;top:16px}
  .items{max-height:calc(100vh - 110px);overflow:auto;padding-right:2px}
}

/
