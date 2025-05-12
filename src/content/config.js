import { defineCollection, z } from "astro:content";

const postCollection = defineCollection({
	type: "content",
	schema: z.object({
		title: z.string(),
		description: z.string().min(50).max(160),  // Optimal length for meta description
		dateFormatted: z.string(),
		pubDate: z.string(),
		tags: z.array(z.string()).default([]),     // For categorization and SEO
		image: z.string().optional(),              // Featured image for social sharing
		author: z.string().default("Komal Chowdhary"),
		readingTime: z.number().optional(),        // Estimated reading time in minutes
		featured: z.boolean().default(false),      // To mark featured posts
		draft: z.boolean().default(false),         // To mark draft posts
		keywords: z.array(z.string()).default([]), // SEO keywords
		lastModified: z.string().optional(),       // For content freshness
	}),
});

export const collections = {
	post: postCollection,
};