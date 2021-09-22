<template>
    <Link :href="'/'">
        <!-- <svg class="w-16 h-16" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M11.395 44.428C4.557 40.198 0 32.632 0 24 0 10.745 10.745 0 24 0a23.891 23.891 0 0113.997 4.502c-.2 17.907-11.097 33.245-26.602 39.926z" fill="#6875F5"/>
            <path d="M14.134 45.885A23.914 23.914 0 0024 48c13.255 0 24-10.745 24-24 0-3.516-.756-6.856-2.115-9.866-4.659 15.143-16.608 27.092-31.75 31.751z" fill="#6875F5"/>
        </svg> -->
         <svg width="72" height="72" viewBox="0 0 72 72" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="72" height="72" rx="36" fill="#6875F5"/>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M50 27.6V31.6C53.3137 31.6 56 34.2863 56 37.6V47.6C56 50.9137 53.3137 53.6 50 53.6H22C18.6863 53.6 16 50.9137 16 47.6V37.6C16 34.2863 18.6863 31.6 22 31.6V27.6C22 19.868 28.268 13.6 36 13.6C43.732 13.6 50 19.868 50 27.6ZM26 31.6H46V27.6C46 22.0772 41.5228 17.6 36 17.6C30.4771 17.6 26 22.0772 26 27.6V31.6Z" fill="white"/>
        </svg>
    </Link> 
</template>

<script>
    import { defineComponent } from 'vue'
    import { Link } from '@inertiajs/inertia-vue3';

    export default defineComponent({
        components: {
            Link,
        },
    })
</script>
