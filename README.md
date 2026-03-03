# HTML5 ST-Link V2 Debugger

A web-based ST-Link V2 debugger tool using WebUSB API, no installation required.

---

## Features

- 🔌 **WebUSB Support** - Connect ST-Link V2 directly in browser
- 🔥 **Flash Programming** - Erase, write, and verify firmware
- 📟 **Chip Information** - Read chip ID, voltage, and device info
- 🐛 **Debug Interface** - SWD communication support
- 💾 **File Support** - HEX and BIN format firmware files
- 🌐 **Cross Platform** - Works on any OS with Chrome/Edge browser

## Usage

1. Open [GitHub Pages link](https://mumu2659.github.io/html5-stlinkv2/) or `index.html` locally
2. Click "Connect ST-Link" button
3. Select your ST-Link V2 device
4. Load firmware file (HEX or BIN)
5. Click "Start Programming"

## Requirements

- Chrome/Edge browser with WebUSB support
- ST-Link V2 hardware
- STM32 target device

## Precautions

Before connecting, ensure:
- STM32CubeIDE / CubeProgrammer are closed
- No `st-info` / `st-flash` commands are running in terminal
- If connection fails, physically unplug and replug USB

## Supported Chips

Currently tested with:
- STM32F10x

More chips may work but are not fully tested.

## Development

```bash
# Clone repository
git clone https://github.com/mumu2659/html5-stlinkv2.git

# Open in browser
open index.html
```

## Browser Compatibility

| Browser | Support |
|---------|---------|
| Chrome  | ✅ 61+  |
| Edge    | ✅ 79+  |
| Firefox | ❌ No   |
| Safari  | ❌ No   |

## License

MIT License
