#!/usr/bin/env node

const process = require('process');
const fs = require('fs');
const path = require('path');

const dir = process.argv[2];
const title = process.argv[3] || path.basename(dir);

let html = `
<html>
<head>
<title>${title}</title>
<style>
body {
  background-color: #EEE;
}
svg {
  height: auto;
}
.row {
  display: flex;
  height: 100vh;
  flex-direction: row;
}
.compare {
  flex: 1;
  position: relative;
  margin-left: 20px;
  overflow: auto;
}
.svgContainer {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  opacity: 0;
  pointer-events: none;
}
.svgContainer.visible {
  opacity: 1;
  pointer-events: all;
}
li.toggle span {
  cursor: pointer;
  text-decoration: underline;
  color: blue;
}
</style>
</head>
<body>
<h1>${title}</h1>
`;

const addClass = (svgSrc, className) => {
  return svgSrc.replace('<svg', `<svg class="${className}"`);
};

const addViewbox = svgSrc => {
  const regex = /<svg[^>]+width="(\d+)"[^>]*height="(\d+)"[^>]*>/m;
  const match = regex.exec(svgSrc);
  const width = match[1];
  const height = match[2];

  return svgSrc.replace('<svg', `<svg viewbox="0 0 ${width} ${height}"`);
};

const addID = (id, svgSrc) => svgSrc.replace('<svg', `<svg id="${id}"`);

const prepare = (svgSrc, id) => {
  return addViewbox(
    addID(id, svgSrc.substring(svgSrc.indexOf('<svg'))));
};

const svgs = fs.readdirSync(dir).map(f => {
  if (!f.endsWith(".svg")) return undefined;
  const opts = { encoding: 'utf8' };
  const svg = fs.readFileSync(path.join(dir, f), opts);
  const name = f.substring(0, f.indexOf("."));
  const prefix = name.substring(0, name.indexOf("-"));
  return { name, prefix, svg: prepare(svg, name) };
}).filter(svg => svg);
svgsByPrefix = {};
svgs.forEach(({ name, prefix, svg }) => {
  if (!svgsByPrefix[prefix]) svgsByPrefix[prefix] = [];
  svgsByPrefix[prefix].push({ name, svg });
});

Object.keys(svgsByPrefix).sort().forEach(prefix => {
  html += `
  <section>
    <h2>${prefix}</h2>
    <div class="row">
    <ul>`
  svgsByPrefix[prefix].forEach(({ name, svg }) => {
    html += `
      <li class="toggle">
        <span onclick="document.querySelector('#compare-${prefix} .visible').classList.remove('visible'); document.getElementById('${name}').parentElement.classList.add('visible');">
          ${name.replace(prefix, '')}
        </span>
      </li>
    `;
  });
  html += `
    </ul>
    <div id="compare-${prefix}" class="compare">`;
  svgsByPrefix[prefix].forEach(({ name, svg }, i) => {
    let className = "svgContainer";
    if (i === 0) className += " visible";
    html += `<div class="${className}"><p>${name}</p>${svg}</div>`;
  });
  html += `
    </div>
    </div>
  </section>
  `;
});

html += `
<script>
document.addEventListener('keydown', (event) => {
  if ((event.ctrlKey || event.metaKey) && event.key === '=') {
    [ ...document.querySelectorAll('svg') ].forEach(svg => {
      svg.setAttribute('width', 2*svg.clientWidth);
      svg.removeAttribute('height');
    });
    event.stopPropagation();
    event.preventDefault();
  } else if ((event.ctrlKey || event.metaKey) && event.key === '-') {
    [ ...document.querySelectorAll('svg') ].forEach(svg => {
      svg.setAttribute('width', Math.round(0.5*svg.clientWidth));
      svg.removeAttribute('height');
    });
    event.stopPropagation();
    event.preventDefault();
  }
})
</script>
</body>
</html>
`;

fs.writeFileSync(path.join(dir, 'report.html'), html);
