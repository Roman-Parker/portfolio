<template>
    <section
        class="bg-darkSlate text-offWhite min-h-screen flex items-center justify-center py-12 px-4"
    >
        <div class="max-w-4xl w-full grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Image / Photo Column -->
            <div class="flex justify-center items-center">
                <!-- Replace this placeholder with your actual photo or illustration -->
                <img
                    src="https://via.placeholder.com/250"
                    alt="Your Photo"
                    class="rounded-full border-4 border-turquoise shadow-lg"
                />
            </div>

            <!-- Content Column -->
            <div class="flex flex-col justify-center">
                <h1 class="text-4xl font-bold mb-4">About Me</h1>
                <p class="mb-4 leading-relaxed">
                    Hi there! I'm <span class="text-turquoise">Roman</span>, a
                    Full-Stack Developer. I enjoy creating things that live on
                    the internet, whether that be websites, applications, or
                    anything in between. I specialize in technologies like
                    <span class="font-semibold">Vue</span>,
                    <span class="font-semibold">Python</span>, and
                    <span class="font-semibold">Tailwind CSS</span>.
                </p>
                <p class="mb-4 leading-relaxed">
                    I've spent the last few years honing my skills in designing
                    intuitive user interfaces, architecting RESTful APIs, and
                    deploying production-ready apps to the cloud. When I'm not
                    coding, I enjoy playing Badminton, board games, walks,
                    grabbing a drink with some friends. My more nerdy hobbies
                    include reading up on the latest tech trends, and
                    contributing to open-source projects.
                </p>
                <p class="text-coolGray">
                    Currently based in
                    <span class="text-offWhite font-medium">Linköping</span>.
                </p>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "AboutView",
};
</script>
