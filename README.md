# Affordly website

Marketing site for **https://affordly.gatex.uk**

## Pages

| URL | File |
|-----|------|
| `/` | `index.html` |
| `/privacy.html` | Privacy policy (App Store required) |
| `/support.html` | Support (App Store required) |
| `/terms.html` | Terms of Use (matches [BaseDeck](https://basedeck.gatex.uk/) pattern) |

**Contact email (same as BaseDeck on gatex.uk):** `app-care@gatex.uk`

## Local preview

```bash
cd Affordly/website
python3 -m http.server 8080
# open http://localhost:8080
```

## Deploy (static)

Upload the entire `website/` folder to your host for `affordly.gatex.uk`.

### Coolify (Docker / Nixpacks)

This repo includes:

| File | Purpose |
|------|---------|
| `build.sh` | Writes **`dist/`** (required — Coolify copies `/app/dist` into nginx) |
| `nginx.conf` | Short URLs `/privacy`, `/support`, `/terms` → `.html` |
| `Dockerfile` | Optional single-stage nginx image (no `dist` build stage) |

**If deploy fails with `"/app/dist": not found`:** the build phase must run `./build.sh` or `npm run build` (see `nixpacks.toml`).

**If deploy fails with `/bin/bash: -c: option requires an argument`:** Coolify is running `bash -c` with an **empty** command. In the app settings, **clear** custom Install/Build commands (use repo defaults), or set **exactly** one of:

| Field | Value |
|-------|--------|
| Build command | `npm run build` |
| Install command | *(leave empty)* |

Do **not** put `bash -c` alone in any command field.

**Coolify settings (pick one):**

1. **Dockerfile (recommended)** — Build pack: **Dockerfile** in repo root. Clear custom build/install commands. Multi-stage image builds `dist/` and serves with nginx.
2. **Nixpacks** — Uses `nixpacks.toml` + `build.sh`. Build: `npm run build` or leave empty if `nixpacks.toml` is detected. Output: `dist`

Examples:

- **Cloudflare Pages** — project root = `Affordly/website`, custom domain `affordly.gatex.uk`
- **Netlify** — publish directory = `Affordly/website` or `dist` after `npm run build`
- **nginx** — `root /var/www/affordly; index index.html;`

### DNS (gatex.uk)

Add a record for subdomain `affordly`:

| Type | Name | Value |
|------|------|--------|
| CNAME | affordly | your-host (e.g. `xxx.pages.dev` or `xxx.netlify.app`) |

Or A record to your server IP.

## After deploy

1. Update App Store Connect URLs to `https://affordly.gatex.uk/privacy.html` and `.../support.html`
2. Push metadata: `bash scripts/asc-push-metadata.sh` (after updating `metadata-asc/`)
3. In-app mail uses `app-care@gatex.uk` (Settings → feedback)

## Assets

- `assets/finn.png` — mascot (from app animations)
- `assets/screenshot-home.png` — App Store capture
- `assets/styles.css` — shared styles (matches app palette)
