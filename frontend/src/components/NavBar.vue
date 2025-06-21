<template>
    <!-- Navbar -->
    <header class="bg-darkSlate">
        <nav
            class="mx-auto max-w-7xl px-4 py-4 flex items-center justify-between"
        >
            <!-- Logo / Branding -->
            <div class="text-xl font-bold">
                <router-link
                    to="/"
                    class="hover:text-turquoise-light"
                >
                    MyPortfolio
                </router-link>
            </div>

            <!-- Navigation Links -->
            <div class="space-x-6 hidden sm:flex">
                <!-- Home -->
                <router-link
                    to="/"
                    class="relative group transition-colors font-semibold"
                    exact-active-class="text-turquoise"
                >
                    <span>{{ t("home") }}</span>
                    <AnimatedUnderline />
                </router-link>

                <!-- Portfolio -->
                <router-link
                    to="/portfolio"
                    class="relative group transition-colors font-semibold"
                    active-class="text-turquoise"
                >
                    <span>{{ t("projects") }}</span>
                    <AnimatedUnderline />
                </router-link>

                <!-- About Me -->
                <router-link
                    to="/about"
                    class="relative group transition-colors font-semibold"
                    active-class="text-turquoise"
                >
                    <span>{{ t("about_me") }}</span>
                    <AnimatedUnderline />
                </router-link>

                <!-- Contact -->
                <router-link
                    to="/contact"
                    class="relative group transition-colors font-semibold"
                    active-class="text-turquoise"
                >
                    <span>{{ t("contact") }}</span>
                    <AnimatedUnderline />
                </router-link>
            </div>
            <LanguageSwitcher />
            <!-- FIXME: Mobile toggle -->
        </nav>
    </header>
</template>

<script setup lang="ts">
import { useI18n } from "vue-i18n";
import AnimatedUnderline from "@/components/AnimatedUnderline.vue";
import LanguageSwitcher from "./LanguageSwitcher.vue";

const { t } = useI18n();
</script>
