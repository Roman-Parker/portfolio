<template>
    <!-- Navbar -->
    <header class="bg-darkSlate">
        <nav
          class="mx-auto max-w-7xl px-4 py-4 flex items-center justify-between"
        >
          <!-- Logo / Branding -->
          <div class="text-xl font-bold">
            <router-link to="/" class="hover:text-turquoise-light">
              MyPortfolio
            </router-link>
          </div>

          <!-- Navigation Links -->
          <div class="space-x-6 hidden sm:flex">
            <!-- Home -->
            <router-link
              to="/"
              class="relative group transition-colors"
              exact-active-class="text-turquoise font-semibold"
            >
              Home
              <!-- Animated Underline -->
              <span
                class="absolute left-1/2 -translate-x-1/2 bottom-0 h-[2px] w-full bg-current
                       scale-x-0 group-hover:scale-x-100 origin-center
                       transition-transform duration-300"
              ></span>
            </router-link>

            <!-- Portfolio -->
            <router-link
              to="/portfolio"
              class="relative group transition-colors"
              active-class="text-turquoise font-semibold"
            >
              Portfolio
              <span
                class="absolute left-1/2 -translate-x-1/2 bottom-0 h-[2px] w-full bg-current
                       scale-x-0 group-hover:scale-x-100 origin-center
                       transition-transform duration-300"
              ></span>
            </router-link>

            <!-- About Me -->
            <router-link
              to="/about"
              class="relative group transition-colors"
              active-class="text-turquoise font-semibold"
            >
              About me
              <span
                class="absolute left-1/2 -translate-x-1/2 bottom-0 h-[2px] w-full bg-current
                       scale-x-0 group-hover:scale-x-100 origin-center
                       transition-transform duration-300"
              ></span>
            </router-link>

            <!-- Contact -->
            <router-link
              to="/contact"
              class="relative group transition-colors"
              active-class="text-turquoise font-semibold"
            >
              Contact
              <span
                class="absolute left-1/2 -translate-x-1/2 bottom-0 h-[2px] w-full bg-current
                       scale-x-0 group-hover:scale-x-100 origin-center
                       transition-transform duration-300"
              ></span>
            </router-link>
          </div>

          <!-- FIXME: Mobile toggle? -->
        </nav>
      </header>
</template>

<script>
export default {
    name: 'NavBar'
}
</script>