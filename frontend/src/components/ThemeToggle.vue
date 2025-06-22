<template>
    <div class="relative inline-flex items-center">
        <select
            v-model="selectedTheme"
            @change="onChange"
            class="bg-surface text-text text-sm border border-border rounded px-2 py-1 appearance-none pr-6 transition-colors duration-300"
        >
            <option
                v-for="theme in themes"
                :key="theme.value"
                :value="theme.value"
            >
                {{ theme.label }}
            </option>
        </select>
        <div class="absolute right-2 pointer-events-none text-muted text-xs">
            ▼
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";

const themes = [
    { label: "Light", value: "light" },
    { label: "Dark", value: "dark" },
    { label: "Solar", value: "theme-solarized" },
];

const selectedTheme = ref("light");

const setTheme = (theme: string) => {
    const html = document.documentElement;
    html.classList.remove("light", "dark", "theme-solarized");
    html.classList.add(theme);
    localStorage.setItem("theme", theme);
};

const onChange = () => {
    setTheme(selectedTheme.value);
};

onMounted(() => {
    const saved = localStorage.getItem("theme") || "light";
    selectedTheme.value = saved;
    setTheme(saved);
});
</script>

<style scoped>
/* Optional: Hide native select arrow in Chrome */
select {
    background-image: none;
}
</style>
