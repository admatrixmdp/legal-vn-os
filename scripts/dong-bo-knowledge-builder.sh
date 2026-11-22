#!/usr/bin/env bash
# Lấy bản mới nhất của jangtrinh/design-os-knowledge-builder và so với ben-ngoai/design-os-knowledge-builder.
#   bash scripts/dong-bo-knowledge-builder.sh            # chỉ xem thay đổi
#   bash scripts/dong-bo-knowledge-builder.sh --ap-dung  # chạy bộ tự kiểm của bản mới rồi chép vào ben-ngoai/
set -euo pipefail
GOC="$(cd "$(dirname "$0")/.." && pwd)"
DICH="$GOC/ben-ngoai/design-os-knowledge-builder"
TAM="$(mktemp -d)"
trap 'rm -rf "$TAM"' EXIT

git clone --quiet --depth 1 https://github.com/jangtrinh/design-os-knowledge-builder "$TAM/moi"
COMMIT="$(git -C "$TAM/moi" rev-parse HEAD)"
NGAY="$(git -C "$TAM/moi" log -1 --format=%ad --date=short)"
echo "Bản mới nhất: $COMMIT ($NGAY)"

if diff -rq --exclude=.git "$TAM/moi" "$DICH" > "$TAM/khac.txt"; then
  echo "Không có thay đổi."
  exit 0
fi
echo "File khác nhau:"
sed "s#$TAM/moi#[mới]#; s#$DICH#[đang có]#" "$TAM/khac.txt"

if [[ "${1:-}" == "--ap-dung" ]]; then
  ( cd "$TAM/moi" && python3 -I scripts/self_check.py \
      && PYTHONPATH=src python3 -I -m unittest discover -s tests -t . -q )
  find "$TAM/moi" -name __pycache__ -type d -prune -exec rm -rf {} +
  rm -rf "$DICH"
  mkdir -p "$DICH"
  ( cd "$TAM/moi" && tar --exclude=.git -cf - . ) | ( cd "$DICH" && tar -xf - )
  echo "Đã chép. Sửa dòng commit trong ben-ngoai/README.md thành $COMMIT ($NGAY), xem lại ben-ngoai/design-os-knowledge-builder/CHANGELOG.md và LICENSE (giấy phép có đổi không), rồi mở PR."
fi
