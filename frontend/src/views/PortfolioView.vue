<template>
    <div class="min-h-screen bg-darkSlate text-offWhite">
        <!-- Portfolio Container -->
        <section class="container mx-auto px-4 py-8">
            <h1 class="text-4xl md:text-5xl font-bold text-center mb-8">My Portfolio</h1>

            <!-- Filter Buttons -->
            <div class="flex flex-wrap justify-center gap-2 mb-8">
                <button v-for="tech in allTechnologies" :key="tech" @click="toggleTechFilter(tech)"
                    class="px-4 py-2 rounded border border-turquoise transition-colors" :class="selectedTechs.includes(tech)
                        ? 'bg-turquoise text-gunmetal'
                        : 'bg-gunmetal text-offWhite hover:bg-turquoise-light hover:text-gunmetal'">
                    {{ tech }}
                </button>
            </div>

            <!-- Project Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                <div v-for="project in filteredProjects" :key="project.id"
                    class="bg-gunmetal rounded-xl p-4 shadow-xl flex flex-col">
                    <img :src="project.image" :alt="project.title" class="w-full h-48 object-cover rounded-md mb-4" />

                    <h3 class="text-xl font-semibold mb-2">{{ project.title }}</h3>
                    <p class="text-base text-coolGray mb-4">
                        {{ project.description }}
                    </p>

                    <!-- Tech Tags -->
                    <div class="flex flex-wrap gap-2 mb-4">
                        <span v-for="tech in project.technologies" :key="tech"
                            class="text-sm bg-turquoise text-gunmetal px-2 py-1 rounded">
                            {{ tech }}
                        </span>
                    </div>

                    <!-- View Project Button or Link -->
                    <router-link :to="project.link"
                        class="mt-auto inline-block px-4 py-2 bg-turquoise hover:bg-turquoise-light text-gunmetal rounded font-semibold transition-colors">
                        View Project
                    </router-link>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    name: 'PortfolioPage',
    data() {
        return {
            // Active technology filters
            selectedTechs: [],

            // Example filters
            allTechnologies: [
                'Python',
                'Vue',
                'Docker',
                'JavaScript',
                'Node.js'
            ],

            // Example project data
            projects: [
                {
                    id: 1,
                    title: 'Vue Docker App',
                    image:
                        'https://via.placeholder.com/400x200.png?text=Vue+Docker+Project',
                    description:
                        'A containerized Vue.js application showcasing containerization with Docker.',
                    technologies: ['Vue', 'Docker'],
                    link: '/portfolio/vue-docker'
                },
                {
                    id: 2,
                    title: 'Python Data Pipeline',
                    image: 'https://via.placeholder.com/400x200.png?text=Python+Data+Project',
                    description:
                        'Data processing pipeline built with Python, leveraging various libraries.',
                    technologies: ['Python'],
                    link: '/portfolio/python-pipeline'
                },
                {
                    id: 3,
                    title: 'Fullstack JS App',
                    image:
                        'https://via.placeholder.com/400x200.png?text=Fullstack+JavaScript+App',
                    description:
                        'A Node.js backend with a Vue frontend for real-time chat and data handling.',
                    technologies: ['JavaScript', 'Vue', 'Node.js'],
                    link: '/portfolio/fullstack-js'
                },
                {
                    id: 4,
                    title: 'Container Monitoring Tool',
                    image:
                        'https://via.placeholder.com/400x200.png?text=Container+Monitoring+Tool',
                    description:
                        'A simple monitoring dashboard for Docker containers, built with Vue and Python.',
                    technologies: ['Docker', 'Vue', 'Python'],
                    link: '/portfolio/container-monitoring'
                },
            ]
        };
    },
    computed: {
        // Return projects that match any selected filters
        filteredProjects() {
            if (this.selectedTechs.length === 0) {
                return this.projects;
            }
            return this.projects.filter((proj) =>
                proj.technologies.some((tech) => this.selectedTechs.includes(tech))
            );
        }
    },
    methods: {
        toggleTechFilter(tech) {
            if (this.selectedTechs.includes(tech)) {
                // Remove filter if already selected
                this.selectedTechs = this.selectedTechs.filter(
                    (t) => t !== tech
                );
            } else {
                // Add filter
                this.selectedTechs.push(tech);
            }
        }
    }
};
</script>
<style scoped>
.text-coolGray {
    color: #9CA3AF;
}
</style>
