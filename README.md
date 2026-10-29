# legal-vn-os

**Thư viện luật Việt Nam dùng chung cho hệ MQ.** Mọi repo cần dẫn luật (kế toán, tuân thủ, marketing, sale, sản phẩm) tra về đây, không tự giữ bản riêng.

> ⚠️ Không phải tư vấn pháp lý. Nội dung có thể sai hoặc lỗi thời. Việc có rủi ro tiền hoặc phạt phải hỏi luật sư.

## Repo này làm gì, không làm gì

| Làm | Không làm |
|---|---|
| Giữ danh sách văn bản luật: số hiệu, ngày hiệu lực, link Công báo, đã đọc tới điều nào | **Nhắc việc, giao việc tuân thủ** → việc đó ở `admatrixmdp/compliance-vn` |
| Ghi luật nào đã bị thay, thay từ ngày nào | Hạch toán, quy tắc kế toán → `Company-finance-accountant-os` |
| Skill tư vấn pháp lý: rà sản phẩm số (web, app, landing), sau này thêm hợp đồng, nhãn hiệu | |

`compliance-vn` = **nhắc việc** (tháng này nộp gì, ai làm). `legal-vn-os` = **thư viện luật** (luật nào đang áp dụng). Luật đổi thì sửa ở đây, rồi báo sang `compliance-vn`.

## Cấu trúc

| Thư mục | Chứa gì | Trạng thái |
|---|---|---|
| `ben-ngoai/vn-legal-skills/` | Bản sao nguyên vẹn repo `Tiro-dev-NT/vn-legal-skills` (MIT): skill `vn-legal-check`, 12 mảng luật, 106 văn bản, trích nguyên văn Công báo | Đã có |
| `nguon/` | Sổ văn bản dùng chung cho cả hệ | Chưa dựng — xem `nguon/README.md` |
| `scripts/dong-bo-vn-legal-skills.sh` | Lấy bản mới nhất của repo gốc, báo file nào đổi | Đã có |
| `.claude-plugin/` | Cài skill `vn-legal-check` từ repo này | Đã có |

## Cài skill rà sản phẩm số

```
/plugin marketplace add admatrixmdp/legal-vn-os
/plugin install vn-legal-check@legal-vn-os
```

Rồi mở dự án cần rà và nói: *"rà dự án này theo luật Việt Nam"*. Skill chỉ đọc mã và viết báo cáo, không sửa gì.

Ví dụ một dòng báo cáo: *"Ô đồng ý nhận email đang tick sẵn — `signup.js:42` — NĐ 330/2026 Điều 43 khoản 1 điểm c — 30–50 triệu (tổ chức)."*

## Cập nhật từ repo gốc

```bash
bash scripts/dong-bo-vn-legal-skills.sh          # xem thay đổi
bash scripts/dong-bo-vn-legal-skills.sh --ap-dung   # chép bản mới vào ben-ngoai/
```

Chạy hằng tháng. Không sửa trực tiếp trong `ben-ngoai/`. Thấy lỗi thì gửi lại cho tác giả gốc (issue hoặc PR) để bản gốc và bản mình không lệch nhau.

## Nguồn

`ben-ngoai/vn-legal-skills/` — © 2026 vn-legal-skills contributors, giấy phép MIT (xem `ben-ngoai/vn-legal-skills/LICENSE`). Lấy tại commit ghi trong `ben-ngoai/README.md`.
