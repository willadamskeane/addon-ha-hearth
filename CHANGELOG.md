## 0.1.7

- Track [Hearth 0.1.7](https://github.com/willadamskeane/ha-hearth/releases/tag/0.1.7), which fades scroll edges into the page background in low-power mode instead of painting a near-white veil over dark presets.

## 0.1.6

- Track [Hearth 0.1.6](https://github.com/willadamskeane/ha-hearth/releases/tag/0.1.6), which stops the room tab strip from inheriting the container padding, so raising Padding X moves the dashboard content without pushing tabs off the end.

## 0.1.5

- Track [Hearth 0.1.5](https://github.com/willadamskeane/ha-hearth/releases/tag/0.1.5), which hides the Home Assistant panel title bar above the Ingress frame and returns the full screen height to the dashboard.

## 0.1.3

- Use the live Home Assistant frontend origin for Ingress authentication so secure-context proxies such as Kiosk Satellite can cold-start Hearth without a blocked OAuth redirect.

## 0.1.2

- Reuse Home Assistant's authenticated browser session in Ingress instead of starting an OAuth redirect that Home Assistant rejects inside the Ingress iframe.
- Preserve standalone Hearth OAuth behavior outside Ingress.

## 0.1.1

- Build the Home Assistant app from the `willadamskeane/ha-hearth` fork.
- Keep the internal Supervisor URL server-side and derive the browser-facing Home Assistant URL from Ingress or direct-port access.
- Return OAuth callbacks to the active Hearth Ingress path.

## 0.1.0

Initial release, tracking [Hearth 0.1.0](https://github.com/knowald/ha-hearth/releases/tag/0.1.0).
