# hugo-blog

Source of https://blog.efecelik.net, built with [Hugo](https://gohugo.io/) and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme (git submodule).

## Clone

```bash
git clone --recurse-submodules https://github.com/efe-clk/hugo-blog.git
# already cloned without submodules?
git submodule update --init --recursive
```

## New post

```bash
hugo new posts/my-post.md   # creates content/posts/my-post.md (draft: true)
```

Edit the file and set `draft: false` when it is ready.

## Local preview

```bash
hugo server -D              # http://localhost:1313, -D also shows drafts
```

## Publish

```bash
git add . && git commit -m "New post: ..." && git push
```

Coolify rebuilds the Docker image (Hugo build, then nginx) and deploys automatically on every push to `main`.

## Build the container locally

```bash
docker build -t hugo-blog . && docker run --rm -p 8080:80 hugo-blog   # http://localhost:8080
```
