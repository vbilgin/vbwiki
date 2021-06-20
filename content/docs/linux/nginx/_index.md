---
title: nginx
weight: 2
---

# nginx

## Hide .html in path
Works but bad for SEO: `try_files $uri.html $uri $uri/ =404;`

Better: `try_files $uri.html $uri/ =404;`