---
title: "How to set up Hugo with GitHub Actions"
summary: What Claude.AI told me about it and how I implemented it.
date: 2024-12-02
series: ["basics"]
weight: 1
aliases: ["/hugo-set-up"]
tags: ["Hugo", "Blog", "GitHub Actions"]
author: ["Sara DM"]
cover:
  image: images/ios-shortcuts-alarms.jpg
  hiddenInList: true
ShowToc: false
ShareButtons: twitter, bluesky
---

## Folder Structure
````
mi-blog/
├── config.toml (o config.yml)
├── content/
│   └── posts/
├── themes/
│   └── papermod/
├── static/
├── layouts/  (opcional, para personalizar)
└── archetypes/ (opcional, para plantillas de contenido)
````

## GitHub Actions Blog Deploy Workflow
- Activates after every `push` to the main branch
- It executes jobs defined in Hugo workflow file
- It builds static site
- It deploys GitHub Pages

## Example Hugo workflow file:

```yml
name: Deploy Hugo Site

on:
  push:
    branches:
      - main  # O tu rama principal

permissions:
  contents: write  # Permiso para hacer deploy

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: recursive  # Si usas submódulos en tu tema

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true  # Si usas Hugo Extended

      - name: Build
        run: hugo --minify

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```
## What it will do
1. Clone repository
2. Install Hugo
3. Execute `hugo --minify`
4. Publish content from `public/` to `gh-pages`


## Recomendations
- Store this file in: `.github/workflows/hugo.yml`
- Set your GitHub Pages repository to serve from branch `gh-pages`
- Keep your theme modifications in your repository
- Do not modify original theme files; use overlays instead.