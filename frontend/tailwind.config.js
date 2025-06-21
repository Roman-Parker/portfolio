/** @type {import('tailwindcss').Config} */
module.exports = {
    purge: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
    theme: {
        extend: {
            colors: {
                background: 'var(--bg)',
                surface: 'var(--surface)',
                text: 'var(--text)',
                muted: 'var(--muted)',
                accent: 'var(--accent)',
                accentLight: 'var(--accent-light)',
                border: 'var(--border)',
            },
        },
    },
    plugins: [],
    darkMode: "class",
};
