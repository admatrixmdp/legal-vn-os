# ben-ngoai/ — repo gốc chép nguyên vẹn

| Repo | Commit | Ngày commit | Ngày chép | Giấy phép |
|---|---|---|---|---|
| [Tiro-dev-NT/vn-legal-skills](https://github.com/Tiro-dev-NT/vn-legal-skills) | `fd6e54bbfbb51e52264271d603391f6600b1dfd1` | 2026-10-25 | 2026-10-26 | MIT |

**Kiểm khi chép:** khớp từng file với bản gốc (48 file); bộ tự kiểm của bản gốc chạy đạt: *"OK — 12 mảng, 140 mục, 106 văn bản trong NGUON.md"*.

**Đã kiểm thử ngẫu nhiên 2 văn bản** (2026-10-26): NĐ 254/2026 (hoá đơn điện tử, thay NĐ 123/2020 từ 01/07/2026) và Luật 109/2025/QH15 (thuế TNCN) — cả hai đúng.

**Tầng tri thức:** thu thập, chưa kiểm chứng. Repo gốc mới tạo ngày 25/10/2026, một người duy trì; 10/12 mảng tự ghi "còn phần chưa đối chiếu toàn văn".

**Luật:** không sửa file trong thư mục này. Cập nhật bằng `scripts/dong-bo-vn-legal-skills.sh --ap-dung`, rồi sửa dòng commit ở bảng trên.

---

## design-os-knowledge-builder

| Repo | Commit | Ngày commit | Ngày chép | Giấy phép |
|---|---|---|---|---|
| [jangtrinh/design-os-knowledge-builder](https://github.com/jangtrinh/design-os-knowledge-builder) | `5c5222a25b66b69affe1a1996fba81daa94790b2` | 2026-11-16 | 2026-11-22 | PolyForm Shield 1.0.0 |

**Là gì:** CLI Python 1.0.0 (chỉ thư viện chuẩn, Python ≥3.10) và skill `es-knowledge-forge`. Đóng băng nguồn (sha256), tạo claim có trích nguyên văn, máy kiểm trích dẫn khớp bản gốc, cổng dừng có thẩm định độc lập. Dùng làm động cơ kiểm chứng cho gói tri thức luật của repo này.

**Kiểm khi chép:** khớp từng file với bản gốc (244 file); `scripts/self_check.py` đạt; bộ test gốc chạy đạt *"Ran 542 tests … OK"*.

**Giấy phép:** giữ nguyên `LICENSE` và dòng *"Required Notice: Copyright (c) 2026 Jang Trinh (https://github.com/jangtrinh)"* — điều kiện bắt buộc khi phân phối lại. Điều khoản không cạnh tranh: không dùng để làm sản phẩm thay thế cho chính công cụ này.

**Chạy từ bản chép:** `PYTHONPATH=ben-ngoai/design-os-knowledge-builder/src python3 -m knowledge_builder.cli --help`. Văn bản PDF cần thêm `pdftotext` (gói `poppler-utils`).

**Tầng tri thức:** thu thập, chưa kiểm chứng. Một người duy trì.

**Luật:** không sửa file trong thư mục này. Cập nhật bằng `scripts/dong-bo-knowledge-builder.sh --ap-dung`, rồi sửa dòng commit ở bảng trên.
