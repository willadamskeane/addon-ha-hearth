# addon-ha-hearth

Home Assistant add-on for the [Will Adams-Keane Hearth fork](https://github.com/willadamskeane/ha-hearth), a dashboard for wall tablets, phones and desktops.

## About this fork

This is a fork of [knowald/addon-ha-hearth](https://github.com/knowald/addon-ha-hearth). It packages [willadamskeane/ha-hearth](https://github.com/willadamskeane/ha-hearth), a fork of Hearth tuned for an Android wall tablet: a Lenovo ThinkSmart View running the Kiosk Satellite app with a Voice Satellite. That README's "About this fork" section covers the dashboard changes: Ingress sign-in, low-end tablet performance, the narrow layout, scroll-safe taps and the camera grid.

Differences from the upstream add-on:

- **Builds the fork.** The image clones `willadamskeane/ha-hearth` at the tag named by `version` and publishes to `ghcr.io/willadamskeane/addon-ha-hearth-{arch}`. The store shows it as "Hearth (Will's fork)", and its version numbers follow the fork (0.1.x), not upstream.
- **Ingress sign-in without a token prompt.** The browser-facing Home Assistant URL is derived from trusted Ingress headers, so upstream's `hass_public_url` option isn't needed. The internal Supervisor hostname never reaches the browser.
- **Trusted direct route for wall tablets**, with the `direct_access`, `trusted_clients` and `low_power` options below. `homeassistant_api` is enabled for this route.

### Options

| Option | Default | What it does |
|---|---|---|
| `direct_access` | `false` | Turns on the trusted direct route on the add-on's exposed port (set a port under Network). |
| `trusted_clients` | `[]` | IP addresses allowed to use that route, for example your kiosk tablet's fixed address. Requests from these addresses reach Home Assistant's API and WebSocket through the add-on's Supervisor credentials, with no sign-in in the browser. Addresses come from the TCP connection, not forwarded headers. |
| `low_power` | `false` | Serves trusted direct clients Hearth's low-power rendering, without blurs or animated shadows, for weak tablets. |

The direct route acts with the add-on's own access to Home Assistant, so list only fixed addresses of devices you control, and leave `direct_access` off if you don't need it. Everyone else uses Ingress as usual.

## Install

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fwilladamskeane%2Faddon-ha-hearth)

To add the repository by hand, open Settings, Apps, App Store, then Repositories from the overflow menu, and paste `https://github.com/willadamskeane/addon-ha-hearth`. Install Hearth (Will's fork) from the store once the repository is listed, then start it.

Hearth appears in the sidebar and is served over Ingress. Setting a port in the add-on configuration exposes it directly as well, which is what wall tablets should use. Dashboard configuration is stored on the add-on's own volume and survives updates.

## How it builds

`version` in `config.yaml` names the `ha-hearth` tag the image is built from, so the add-on and the application move together. Pushing to `main` builds `ghcr.io/willadamskeane/addon-ha-hearth-{arch}` for `aarch64` and `amd64` against pinned Home Assistant base images.

The published container packages must be public for the Supervisor to pull them. GitHub creates them private on the first push; change that once per package under Packages, Package settings, Change visibility. Later pushes keep the setting.
