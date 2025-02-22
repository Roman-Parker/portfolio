/** @type {import('tailwindcss').Config} */
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        darkSlate: '#0F172A',
        gunmetal: '#141A1F',
        turquoise: {
          DEFAULT: '#14B8A6',
          light: '#2DD4BF',
        },
        coolGray: '#9CA3AF',
        offWhite: '#F8FAFC',
      },
    },
  },
  plugins: [],
}
