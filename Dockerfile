# Affordly static site — works with Coolify (build stage → /app/dist → nginx).
# Build context: repository root. Prefer this Dockerfile as the Coolify build pack.

FROM node:22-alpine AS build
WORKDIR /app
COPY package.json build.sh ./
COPY index.html privacy.html support.html terms.html ./
COPY assets ./assets/
RUN chmod +x build.sh && ./build.sh

FROM public.ecr.aws/docker/library/nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
