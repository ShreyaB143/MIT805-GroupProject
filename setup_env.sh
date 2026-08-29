#!/usr/bin/env bash
# MIT 805 Group Project - environment bootstrap
# Run this from inside ~/Projects/MIT805-GroupProject (or wherever you keep the repo)
set -euo pipefail

echo "== Checking Python version =="
PYTHON_BIN="python3"
if ! command -v "$PYTHON_BIN" &>/dev/null; then
  echo "python3 not found on PATH. Install Python 3.10+ (e.g. via pyenv or brew) and re-run."
  exit 1
fi
PY_VER=$("$PYTHON_BIN" -c 'import sys; print("%d.%d" % sys.version_info[:2])')
echo "Found Python $PY_VER"
REQUIRED="3.10"
if [ "$(printf '%s\n' "$REQUIRED" "$PY_VER" | sort -V | head -n1)" != "$REQUIRED" ]; then
  echo "Python $PY_VER is older than the required 3.10+. If you use pyenv:"
  echo "  pyenv install 3.11.9 && pyenv local 3.11.9"
  exit 1
fi

echo "== Checking Java (need Java 21 / Temurin for Spark 4.2.0) =="
if command -v java &>/dev/null; then
  java -version
else
  echo "Java not found. Install Temurin 21, e.g.:"
  echo "  brew install --cask temurin@21"
  exit 1
fi

echo "== Creating virtual environment (.venv) =="
"$PYTHON_BIN" -m venv .venv
source .venv/bin/activate

echo "== Upgrading pip =="
pip install --upgrade pip

echo "== Installing requirements =="
pip install -r requirements.txt

echo "== Done =="
echo "Virtual environment ready at .venv"
echo "Activate it in a new shell with: source .venv/bin/activate"
echo "In VS Code: Cmd+Shift+P -> 'Python: Select Interpreter' -> choose ./.venv/bin/python"
