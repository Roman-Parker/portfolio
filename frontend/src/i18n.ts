import { createI18n } from 'vue-i18n'
import en from '../languages/en'
import sv from '../languages/sv'
import de from '../languages/de'

type MessageSchema = Record<string, string | Record<string, string>>;

const messages: { en: MessageSchema; de: MessageSchema; sv: MessageSchema } = { en, de, sv };

const i18n = createI18n<{ message: MessageSchema }, 'en' | 'de' | 'sv'>({
    legacy: false,
    locale: 'en',
    fallbackLocale: 'en',
    messages
})

export default i18n