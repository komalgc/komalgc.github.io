import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';


export async function GET(context) {
    const post = await getCollection("post");
    const items = post
    .sort((a, b) => Date.parse(b.data.pubDate) - Date.parse(a.data.pubDate)) 
    .map(({ data: { pubDate, title, description }, slug }) => ({
      title,              
      description,        
      link: `${context.site}/post/${slug}`,  
      pubDate: new Date(pubDate), 
    }));
    return rss({
    title: 'Komal`s Blog',
    description: 'Komal`s software testing blog',
    site: context.site,
    trailingSlash: false,
    stylesheet: '/rss/styles.xsl',
    items,
    customData: `<language>en-us</language>`,
  });
}