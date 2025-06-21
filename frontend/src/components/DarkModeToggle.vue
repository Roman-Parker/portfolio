<template>
    <button @click="toggleTheme">
        <!-- Heroicons v2 Outline Sun -->
        <svg
            v-if="!isDark"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="w-6 h-6"
        >
            <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M12 3v1.5m6.364
           1.636l-1.06 1.06M21 12h-1.5m-1.636
           6.364l-1.06-1.06M12 19.5V21M6.364
           17.636l-1.06 1.06M3 12h1.5m1.636-6.364
           l1.06 1.06M12 7.5a4.5 4.5 0 100
           9 4.5 4.5 0 000-9z"
            />
        </svg>

        <!-- Heroicons v2 Outline Moon -->
        <svg
            v-else
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="w-6 h-6"
        >
            <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M21.752
           15.002A9.718 9.718 0 0118 15.75 9.75
           9.75 0 018.25 6c0-1.35.28-2.63.78-3.752a.75.75
           0 00-1.232-.82 11.25 11.25 0 0013.774
           13.774.75.75 0 00-.82-1.232z"
            />
        </svg>
    </button>
</template>

<script setup>
import { ref, onMounted } from "vue";

const isDark = ref(true);

onMounted(() => {
    const userPreference = localStorage.getItem("color-theme");

    if (userPreference === "dark") {
        document.documentElement.classList.add("dark");
        isDark.value = true;
    } else {
        document.documentElement.classList.remove("dark");
        isDark.value = false;
    }
});

function toggleTheme() {
    isDark.value = !isDark.value;

    if (isDark.value) {
        document.documentElement.classList.add("dark");
        localStorage.setItem("color-theme", "dark");
    } else {
        document.documentElement.classList.remove("dark");
        localStorage.setItem("color-theme", "light");
    }
}
</script>
