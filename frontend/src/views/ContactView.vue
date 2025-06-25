<template>
    <!-- Full-height, dark background section -->
    <section class="bg-background min-h-screen flex items-center justify-center px-4 py-8 text-text">
        <div class="w-full max-w-md bg-gunmetal rounded-lg shadow-lg p-6">
            <h1 class="text-3xl font-bold mb-6 text-center">Contact</h1>

            <form>
                <!-- Name Input -->
                <div class="mb-4">
                    <label
                        for="name"
                        class="block mb-1 font-semibold"
                    >
                        Name
                    </label>
                    <input
                        type="text"
                        id="name"
                        placeholder="Your Name"
                        class="w-full rounded py-2 px-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-accent transition-colors"
                    />
                </div>

                <!-- Email Input -->
                <div class="mb-4">
                    <label
                        for="email"
                        class="block mb-1 font-semibold"
                    >
                        Email
                    </label>
                    <input
                        type="email"
                        id="email"
                        placeholder="you@example.com"
                        class="w-full rounded py-2 px-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-accent transition-colors"
                    />
                </div>

                <!-- Message Textarea -->
                <div class="mb-4">
                    <label
                        for="message"
                        class="block mb-1 font-semibold"
                    >
                        Message
                    </label>
                    <textarea
                        id="message"
                        rows="4"
                        placeholder="Your message..."
                        class="w-full rounded py-2 px-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-accent transition-colors"
                    ></textarea>
                </div>

                <!-- Checkbox -->
                <div class="flex items-center mb-4">
                    <input
                        type="checkbox"
                        id="copy"
                        class="rounded text-accent focus:ring-accent mr-2 cursor-pointer"
                        checked
                    />
                    <label
                        for="copy"
                        class="cursor-pointer"
                    >
                        Send me a copy of this message
                    </label>
                </div>

                <!-- Submit Button -->
                <button
                    type="submit"
                    class="w-full py-2 bg-accent hover:bg-accentLight text-surface font-semibold rounded transition-colors"
                >
                    Send
                </button>
            </form>
        </div>
    </section>
</template>

<script>
export default {
    name: "ContactView",
};
</script>
