---
title: nginx
weight: 2
---

# nginx

## Hide .html in path
Works but bad for SEO: `try_files $uri.html $uri $uri/ =404;`

Better: `try_files $uri.html $uri/ =404;`

## Custom 404 pages
`sudo nano /etc/nginx/sites-available/domain.com`

Add this (this prevents people from directly accessing the 404 page):
```
error_page 404 /404.html;
location  /404.html {
  internal;
}
```
Or `error_page   404  =  /404.html;` if direct access is OK