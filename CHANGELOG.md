# Changelog — DAIC CRM

Todos los cambios notables en este proyecto se documentan en este archivo.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/).
Versionado sigue [Semantic Versioning](https://semver.org/lang/es/) con prefijo `DAIC-v`.

> **Nota:** La versión en `package.json` (`4.10.1`) refleja la base upstream de Chatwoot.
> El versionado DAIC es independiente y se gestiona via tags Git (`DAIC-vX.Y.Z`).

---

## [Unreleased]

_Cambios en develop pendientes de incluir en un release._

---

## [DAIC-v0.1.0] - 2026-02-12

Primer milestone: fork profesionalizado de Chatwoot con white-label completo y
infraestructura de desarrollo establecida.

### Agregado
- **Branding completo:** Logo DAIC (light/dark), favicons (16/32/96/512), imágenes de onboarding
- **Configuración white-label:** `INSTALLATION_NAME`, `BRAND_NAME` → "DAIC CRM"; URLs → daicapp.com
- **i18n:** Traducciones de login (en/es) y survey (en) actualizadas a "DAIC CRM"
- **Base de datos:** Migración `20260206000000_rebrand_to_daic_crm.rb` (reversible)
- **Swagger/API:** Títulos actualizados a "DAIC CRM"
- **CI/CD:** Workflow `docker-publish.yml` para build y push a GHCR
- **Infraestructura:** `docker-compose.local.yaml` para desarrollo local
- **Protección de ramas:** Branch protection rules en `main` y `develop` (require PR, status checks, no force push)
- **Hook local:** `bin/validate_push` bloquea push directo a main/master/develop
- **PR Template:** Template DAIC con Conventional Commits y checklist
- **Auto-delete:** Head branches se borran automáticamente tras merge
- **Documentación:** `DAIC_CUSTOMIZATIONS.md` con mapa completo de personalizaciones

### Cambiado
- Triggers de CI actualizados: `master` → `main` en todos los workflows activos
- 8 workflows activos cubren tanto `develop` como `main`
- `globalConfig.js`: `isACustomBrandedInstance` verifica contra "DAIC CRM"
- `super_admin/application.html.erb`: Título dinámico con `application_title`

### Desactivado
- 8 workflows de Chatwoot movidos a `.github/workflows-disabled/` (stale, lock, nightly_installer, codespace, auto-assign, deploy_check, publish_ee_docker, publish_foss_docker)

### Base upstream
- Chatwoot v4.10.1 (sincronizado al 100% con `upstream/develop`)
- 53 commits propios sobre la base upstream
