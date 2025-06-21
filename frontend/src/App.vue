<template>
    <div class="min-h-screen bg-darkSlate text-offWhite">
        <!-- Navigation -->
        <NavBar />

        <!-- Main Content -->
        <main class="mx-auto max-w-7xl px-4 py-8">
            <router-view />
        </main>
    </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
export default {
    components: {
        NavBar,
    },
};
</script>
