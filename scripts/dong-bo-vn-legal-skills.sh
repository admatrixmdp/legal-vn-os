#!/usr/bin/env bash
# Lấy bản mới nhất của Tiro-dev-NT/vn-legal-skills và so với ben-ngoai/vn-legal-skills.
#   bash scripts/dong-bo-vn-legal-skills.sh            # chỉ xem thay đổi
#   bash scripts/dong-bo-vn-legal-skills.sh --ap-dung  # chép bản mới vào ben-ngoai/
set -euo pipefail
GOC="$(cd "$(dirname "$0")/.." && pwd)"
DICH="$GOC/ben-ngoai/vn-legal-skills"
TAM="$(mktemp -d)"
trap 'rm -rf "$TAM"' EXIT

git clone --quiet --depth 1 https://github.com/Tiro-dev-NT/vn-legal-skills "$TAM/moi"
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
  ( cd "$TAM/moi" && python3 -I scripts/kiem-nhat-quan.py )
  rm -rf "$DICH"
  mkdir -p "$DICH"
  ( cd "$TAM/moi" && tar --exclude=.git -cf - . ) | ( cd "$DICH" && tar -xf - )
  echo "Đã chép. Sửa dòng commit trong ben-ngoai/README.md thành $COMMIT ($NGAY), xem lại ben-ngoai/vn-legal-skills/LICH-SU-THAY-DOI.md, rồi mở PR."
fi
