<template>
    <section
        class="min-h-[calc(100vh-4rem)] flex flex-col items-center justify-center px-4 transition-colors duration-300"
    >
        <!-- Hero Heading -->
        <h1 class="text-4xl md:text-5xl font-bold mb-4">
            Hello, I’m
            <span class="text-accent">Roman Parker</span>
        </h1>

        <!-- Intro Paragraph -->
        <p class="text-lg md:text-xl max-w-3xl text-center mb-8 text-muted">
            I’m a Full-Stack Developer who loves building modern, scalable web apps. Explore my portfolio to see some of
            the stuff that I have been working on!
        </p>

        <div>
            <router-link
                to="/portfolio"
                class="inline-block px-6 py-3 bg-accent hover:bg-accentLight text-surface font-semibold rounded transition-colors duration-300"
            >
                View projects
            </router-link>

            <DownloadResumeButton class="ml-2" />
        </div>
    </section>
</template>

<script setup lang="ts">
import DownloadResumeButton from "@/components/DownloadResumeButton.vue";
</script>
