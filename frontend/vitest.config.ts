import { defineConfig } from "vitest/config";
import vue from "@vitejs/plugin-vue";

export default defineConfig({
    plugins: [vue()],
    test: {
        globals: true, // Allows using "describe", "it", etc. without importing
        environment: "jsdom", // Simulates browser environment
        //setupFiles: './test/setup.ts',  // Global test setup (mocks, Vue plugins, etc.)
        include: ["tests/**/*.test.ts", "src/**/*.test.ts"], // Defines where Vitest looks for test files
    },
});
