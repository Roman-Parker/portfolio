<template>
    <!-- Navbar -->
    <header class="bg-darkSlate">
        <nav class="mx-auto max-w-7xl px-4 py-4 flex items-center justify-between">
            <!-- Logo / Branding -->
            <div class="text-xl font-bold">
                <router-link to="/" class="hover:text-turquoise-light">
                    MyPortfolio
                </router-link>
            </div>

            <!-- Navigation Links -->
            <div class="space-x-6 hidden sm:flex">
                <!-- Home -->
                <router-link to="/" class="relative group transition-colors"
                    exact-active-class="text-turquoise font-semibold">
                    Home
                    <AnimatedUnderline />
                </router-link>

                <!-- Portfolio -->
                <router-link to="/portfolio" class="relative group transition-colors"
                    active-class="text-turquoise font-semibold">
                    Portfolio
                    <AnimatedUnderline />
                </router-link>

                <!-- About Me -->
                <router-link to="/about" class="relative group transition-colors"
                    active-class="text-turquoise font-semibold">
                    About me
                    <AnimatedUnderline />
                </router-link>

                <!-- Contact -->
                <router-link to="/contact" class="relative group transition-colors"
                    active-class="text-turquoise font-semibold">
                    Contact
                    <AnimatedUnderline />
                </router-link>
                <DarkModeToggle />
                <LanguageSwitcher />
            </div>

            <!-- FIXME: Mobile toggle -->
        </nav>
    </header>
</template>

<script>
import AnimatedUnderline from '@/components/AnimatedUnderline.vue';
import DarkModeToggle from './DarkModeToggle.vue';
import LanguageSwitcher from './LanguageSwitcher.vue';
export default {
    name: 'NavBar',

    components: {
        AnimatedUnderline,
        DarkModeToggle,
        LanguageSwitcher
    }
}
</script>