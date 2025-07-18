<template>
    <div class="relative">
        <button
            @click="toggleDropdown"
            ref="dropDownRef"
            class="px-4 py-2 border-2 border-accent texr-accent rounded-md hover:bg-accent hover:text-surface transition-colors"
        >
            {{ currentLanguageLabel }}
        </button>

        <div
            v-if="isOpen"
            class="absolute mt-2 w-full bg-gunmetal border border-accent rounded-md shadow-lg duration-300"
        >
            <ul class="py-2">
                <li
                    v-for="(label, code) in availableLanguages"
                    :key="code"
                    @click="changeLanguage(code)"
                    class="px-4 py-2 cursor-pointer hover:bg-accent hover:text-surface transition-colors"
                >
                    {{ label }}
                </li>
            </ul>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from "vue";
import { useI18n } from "vue-i18n";

const { locale } = useI18n();

const availableLanguages: Record<string, string> = {
    en: "English",
    de: "Deutsch",
    sv: "Svenska",
};

const isOpen = ref(false);
const dropDownRef = ref<HTMLElement | null>(null);

const currentLanguageLabel = computed(() => availableLanguages[locale.value] || "Language");

const toggleDropdown = () => {
    isOpen.value = !isOpen.value;
};

const changeLanguage = (lang: string) => {
    locale.value = lang;
    localStorage.setItem("selectedLanguage", lang);
    isOpen.value = false;
};

function handleClickOutside(event: MouseEvent) {
    if (dropDownRef.value && !dropDownRef.value.contains(event.target as Node)) {
        isOpen.value = false;
    }
}

onMounted(() => {
    const savedLang = localStorage.getItem("selectedLanguage");
    if (savedLang && availableLanguages[savedLang]) {
        locale.value = savedLang;
    }
    document.addEventListener("click", (event) => {
        handleClickOutside(event);
    });
});

onUnmounted(() => {
    document.removeEventListener("click", () => {});
});
</script>
