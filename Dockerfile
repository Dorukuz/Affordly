# Static Affordly site — use this Dockerfile in Coolify, or rely on build.sh + generated nginx image.
# Build context: repository root (this folder).
FROM public.ecr.aws/docker/library/nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html privacy.html support.html terms.html ./
COPY assets ./assets/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
