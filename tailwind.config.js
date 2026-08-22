/** Tailwind config for the static build. Rebuild CSS with:  npx tailwindcss@3 -i src/tailwind.in.css -o styles.css --minify  */
module.exports = {
  content: ['./index.html', './rooms.html'],
  theme: {
    extend: {
      colors: {
        ink:    '#12222C',
        deep:   '#16303F',
        deep2:  '#0E2029',
        azure:  '#3D7396',
        sky:    '#A7C9DD',
        cream:  '#F1ECD2',
        ivory:  '#F8F6EC',
        sand:   '#E9E4D2',
      },
      fontFamily: {
        display: ['"JA Suits"', '"DM Serif Display"', 'serif'],
        serif: ['"JA Suits"', 'Newsreader', 'serif'],
        label: ['"JA Suits"', 'Montserrat', 'sans-serif'],
      },
    },
  },
};
