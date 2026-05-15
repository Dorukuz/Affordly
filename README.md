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

Examples:

- **Cloudflare Pages** — project root = `Affordly/website`, custom domain `affordly.gatex.uk`
- **Netlify** — publish directory = `Affordly/website`
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
