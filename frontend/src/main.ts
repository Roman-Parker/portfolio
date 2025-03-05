import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import "./index.css"
import {createPinia} from 'pinia'
import i18n from './i18n.js'

const pinia = createPinia()

const app = createApp(App)

app.use(pinia)
app.use(router)
app.use(i18n)
app.mount('#app')
