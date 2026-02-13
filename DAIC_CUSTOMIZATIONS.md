# DAIC CRM — Customizations over Chatwoot

This document tracks all modifications made to the upstream Chatwoot codebase
for the DAIC white-label platform. Use it as a reference during upstream syncs
to know exactly which files were touched and why.

## Branding — Configuration

| File | Change |
|------|--------|
| `config/installation_config.yml` | INSTALLATION_NAME, BRAND_NAME → "DAIC CRM"; URLs → daicapp.com |
| `enterprise/config/premium_installation_config.yml` | Same as above (Enterprise overlay) |
| `app.json` | name → "DAIC CRM" |
| `public/manifest.json` | name, short_name → "DAIC CRM"; theme_color updated |

## Branding — Assets

| File | Change |
|------|--------|
| `public/brand-assets/logo.svg` | DAIC logo (light) |
| `public/brand-assets/logo_dark.svg` | DAIC logo (dark) |
| `public/favicon-*.png` | DAIC favicons (16, 32, 96, 512) |
| `public/dashboard/images/onboarding/*.png` | Updated onboarding images |

## i18n / Translations

| File | Change |
|------|--------|
| `app/javascript/dashboard/i18n/locale/en/login.json` | Title → "Welcome to DAIC CRM" |
| `app/javascript/dashboard/i18n/locale/es/login.json` | Title → "DAIC CRM" |
| `app/javascript/survey/i18n/locale/en.json` | POWERED_BY → "Powered by DAIC" |

## Database

| File | Change |
|------|--------|
| `db/migrate/20260206000000_rebrand_to_daic_crm.rb` | Migration to update 6 installation configs to DAIC branding (reversible) |

## Views / Templates

| File | Change |
|------|--------|
| `app/views/installation/onboarding/index.html.erb` | Title and welcome message → DAIC CRM |
| `app/views/layouts/super_admin/application.html.erb` | Page title → dynamic with application_title |

## Frontend Components

| File | Change |
|------|--------|
| `app/javascript/shared/store/globalConfig.js` | Branding getters: isACustomBrandedInstance checks against "DAIC CRM" |
| `app/javascript/shared/composables/specs/useBranding.spec.js` | Test expectations updated for DAIC CRM |

## API / Documentation

| File | Change |
|------|--------|
| `swagger/index.html` | Title → "DAIC CRM" |
| `swagger/index.yml` | Title → "DAIC CRM" (description/contact/server still reference Chatwoot — TODO) |

## Infrastructure

| File | Change |
|------|--------|
| `.github/workflows/docker-publish.yml` | New: builds and pushes Docker image to GHCR |
| `docker-compose.local.yaml` | New: local development convenience config |
| `bin/validate_push` | Blocks push to main, master, develop; Spanish messages |

## Project Documentation

| File | Change |
|------|--------|
| `CHANGELOG.md` | New: Keep a Changelog format, tracks DAIC releases (DAIC-vX.Y.Z) |
| `DAIC_CUSTOMIZATIONS.md` | New: this file — maps all customizations for upstream sync reference |

## Known Incomplete Branding (TODO)

- `swagger/index.yml`: description, contact email, server URL still reference Chatwoot
- `app.json`: description still references Chatwoot

## Upstream Merge Notes

**High-conflict files** (will likely conflict on every upstream sync):
- `config/installation_config.yml`
- `enterprise/config/premium_installation_config.yml`
- `app/javascript/shared/store/globalConfig.js`

**Strategy**: On conflicts, keep DAIC values in branding fields; accept upstream changes in everything else.
