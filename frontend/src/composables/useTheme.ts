import { ref, onMounted } from 'vue'

const currentTheme = ref('light')

export function useTheme() {
    const setTheme = (theme: string) => {
        const html = document.documentElement
        html.classList.remove('light', 'dark', 'theme-solarized')
        html.classList.add(theme)
        localStorage.setItem('theme', theme)
        currentTheme.value = theme
    }

    onMounted(() => {
        const saved = localStorage.getItem('theme') || 'light'
        setTheme(saved)
    })

    return {
        currentTheme,
        setTheme
    }
}
