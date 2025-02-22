<template>
    <nav>
        <router-link to="/">Home</router-link>
        <router-link to="/portfolio">Portfolio</router-link>
        <router-link to="/about">About me</router-link>
        <router-link to="/contact">Contact</router-link>
    </nav>
    <router-view />
    <FooterComponent />
</template>

<script>
import FooterComponent from "@/components/FooterComponent.vue"
export default {
    components: {
        FooterComponent
    }
}
</script>

<style>
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    background-color: #303841;
}

nav {
    padding: 30px;
}

nav a {
    font-weight: bold;
    color: #eaeff3;
    padding: 5px;
}

nav a.router-link-exact-active {
    color: #42b983;
}

a:hover {
    text-decoration: underline;
}
</style>
