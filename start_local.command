#!/bin/zsh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

PORT="${1:-8000}"
BROWSER="${2:-auto}"
URL="http://localhost:${PORT}/html5_stlinkv2.html"

if ! command -v python3 >/dev/null 2>&1; then
  echo "未找到 python3，请先安装 Python 3。"
  exit 1
fi

if [[ ! -f "html5_stlinkv2.html" ]]; then
  echo "错误：找不到 html5_stlinkv2.html 文件"
  exit 1
fi

if lsof -i :${PORT} >/dev/null 2>&1; then
  echo "错误：端口 ${PORT} 已被占用"
  echo "正在尝试清理端口..."
  lsof -i :${PORT} | grep -v COMMAND | awk '{print $2}' | xargs kill -9 2>/dev/null
  sleep 1
fi

echo "正在启动本地服务：http://localhost:${PORT}"
echo "按 Ctrl+C 可停止服务"
echo "浏览器模式：${BROWSER}"

sleep 1
case "$BROWSER" in
  chrome)
    if [[ -d "/Applications/Google Chrome.app" ]]; then
      open -a "Google Chrome" "$URL"
    else
      echo "未检测到 Google Chrome，回退到自动模式。"
      BROWSER="auto"
    fi
    ;;
  edge)
    if [[ -d "/Applications/Microsoft Edge.app" ]]; then
      open -a "Microsoft Edge" "$URL"
    else
      echo "未检测到 Microsoft Edge，回退到自动模式。"
      BROWSER="auto"
    fi
    ;;
  auto|default)
    ;;
  *)
    echo "未知浏览器参数: $BROWSER（可用: auto/chrome/edge/default）"
    exit 1
    ;;
esac

if [[ "$BROWSER" == "auto" || "$BROWSER" == "default" ]]; then
  if [[ -d "/Applications/Google Chrome.app" ]]; then
    open -a "Google Chrome" "$URL"
  elif [[ -d "/Applications/Microsoft Edge.app" ]]; then
    open -a "Microsoft Edge" "$URL"
  else
    echo "未检测到 Chrome/Edge，正在使用默认浏览器打开（WebUSB 可能不可用）。"
    open "$URL"
  fi
fi

python3 -m http.server "$PORT"