#!/bin/bash
# Build: compile Tailwind (purged, minified) and inline it into index.html and rooms.html.
# Run this after ANY edit that adds/changes Tailwind classes:   ./build.sh
set -e
cd "$(dirname "$0")"
npx --yes tailwindcss@3 -c tailwind.config.js -i src/tailwind.in.css -o styles.css --minify >/dev/null 2>&1
python3 - <<'PY'
import re
css = open('styles.css').read()
block = '<style id="tw">' + css + '</style>'
for f in ['index.html', 'rooms.html']:
    s = open(f).read()
    if '<style id="tw">' in s:
        s = re.sub(r'<style id="tw">.*?</style>', lambda m: block, s, count=1, flags=re.S)
    else:
        s = re.sub(r'  <link rel="stylesheet" href="styles.css[^"]*" />\n', lambda m: '  ' + block + '\n', s, count=1)
    assert '<style id="tw">' in s and 'href="styles.css' not in s, f
    open(f, 'w').write(s)
    print(f, 'inlined', len(css)//1024, 'KB')
PY
