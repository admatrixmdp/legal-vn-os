# nguon/ — sổ văn bản dùng chung (chưa dựng)

Mục tiêu: **một sổ văn bản luật duy nhất cho cả hệ MQ.** Các repo khác trỏ mã văn bản về đây.

## Việc cần làm

| Bước | Việc |
|---|---|
| 1 | Dời `Company-finance-accountant-os/src/phap-ly/so-dang-ky.yaml` sang đây |
| 2 | Trộn với `ben-ngoai/vn-legal-skills/NGUON.md`; thêm cột `kiem` (số+ngày / toàn văn: Điều …) |
| 3 | Sửa các mục đang lệch. Ưu tiên: NĐ 123/2020 → **đã bị NĐ 254/2026 thay từ 01/07/2026**; điền số hiệu Luật 109/2025 (TNCN), NĐ 310/2025 + NĐ 291/2026 (phạt thuế), NĐ 356/2025 (dữ liệu cá nhân), NQ 198/2025, Luật 71/2025, bộ văn bản GTGT, NĐ 68/2026 + NĐ 141/2026 (bỏ thuế khoán) |
| 4 | Bỏ các nguồn trỏ vòng tròn sang `compliance-vn/references/12-thay-doi-2025-2026.md`; thay bằng link Công báo |
| 5 | Gắn mã văn bản cho 84 mục của `compliance-vn` (trường `can_cu`) |
| 6 | Khi một luật bị thay: liệt kê mục bị ảnh hưởng ở các repo khác, mở việc cần sửa sang repo đó |

Mỗi bước làm bằng PR riêng.
