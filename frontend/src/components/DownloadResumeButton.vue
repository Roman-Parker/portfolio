<template>
    <button
        @click="downloadResume"
        class="inline-block px-6 py-3 border-2 border-accent text-accent font-semibold rounded transition-colors hover:bg-accent hover:text-surface"
    >
        Resume
    </button>
</template>

<script setup lang="ts">
function downloadResume(): void {
    const link = document.createElement("a");
    link.href = "/public/roman_parker_resume.pdf";
    link.setAttribute("download", "roman_parker_resume.pdf");
    link.click();
}
</script>
