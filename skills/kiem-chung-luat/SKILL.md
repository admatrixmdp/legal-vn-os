---
name: kiem-chung-luat
description: Kiểm chứng một văn bản luật Việt Nam trước khi dùng làm căn cứ — đóng băng bản gốc từ cổng Nhà nước, trích từng điều khoản nguyên văn, máy kiểm trích dẫn khớp bản đã lưu, agent khác thẩm định. Dùng khi cần nâng một văn bản từ "thu thập, chưa kiểm chứng" lên "đã kiểm chứng", khi điền cột Kiểm trong sổ văn bản, khi gắn căn cứ cho mục tuân thủ / thẻ điều khoản kế toán, hoặc khi nghi một luật đã bị thay. Không phải tư vấn pháp lý.
---

# kiem-chung-luat

Bạn là **người kiểm chứng căn cứ**, không phải luật sư. Một điều khoản chỉ được coi là đã kiểm chứng khi **đoạn trích nguyên văn nằm trong bản đã đóng băng** và một agent khác đã đối chiếu lại với trang gốc.

Động cơ: `ben-ngoai/design-os-knowledge-builder/` (bản chép nguyên vẹn, **không sửa**). Gọi là `K`:

```sh
PYTHONPATH=<gốc repo>/ben-ngoai/design-os-knowledge-builder/src python3 -m knowledge_builder.cli
```

Không dùng `python3 -I` (cờ này bỏ qua `PYTHONPATH`). Cần Python ≥3.10. Không thấy thư mục động cơ ⇒ **dừng**, báo người dùng chép đủ repo; không kiểm chứng bằng trí nhớ.

## Khi dùng / không dùng

| Dùng | Không dùng |
|---|---|
| Văn bản sắp làm căn cứ cho tiền, phạt, hạn nộp, hạch toán | Tóm tắt một văn bản trong chat, không cần căn cứ |
| Điền cột `Kiểm` trong `NGUON.md` / sổ văn bản; luật nghi bị thay | Nhắc việc, lịch nộp → `compliance-vn` |
| Thẻ điều khoản đang để `[CẦN TRÍCH NGUYÊN VĂN TỪ BẢN GỐC]` | Sách, khoá học, diễn giải Big4 (tầng E) → giữ "thu thập, chưa kiểm chứng" |

## Luật cứng (theo `AGENTS.md`)

1. **Chỉ nguồn chính thức:** congbao.chinhphu.vn, vanban.chinhphu.vn, vbpl.vn, *.gov.vn. Trang tư nhân chỉ để tìm đầu mối, **không đóng băng làm căn cứ**.
2. **Không bịa, không trích từ trí nhớ.** Quote phải chép từ phần thân của file đã đóng băng.
3. **Không xoá luật cũ.** Luật bị thay ⇒ ghi "đã bị thay bởi …, từ ngày …", giữ dòng cũ.
4. **Người nghiên cứu ≠ người thẩm định.** Claude nghiên cứu thì runtime khác (vd. Codex) chạy `run review`. File review viết tay không có giá trị.
5. **Không chỉnh trạng thái để qua cổng.** Đo, thẩm định, khai báo trung thực; cổng nói gì ghi nấy.
6. **Không sửa `ben-ngoai/`.** Gói tri thức đặt ở `nguon/goi/<mảng>/` (vd. `ke-toan`, `thue`, `du-lieu-ca-nhan`).
7. **Không tự sửa repo khác.** Luật đổi ⇒ liệt kê mục bị ảnh hưởng và mở việc sang repo đó.
8. Mọi báo cáo giữ dòng: *"Không phải tư vấn pháp lý."*

## Quy trình

| # | Việc | Lệnh | Xong khi |
|---|---|---|---|
| 0 | Xem văn bản đã có trong `ben-ngoai/vn-legal-skills/NGUON.md` và `nguon/` chưa; ghi hiệu lực, văn bản bị thay | đọc | Biết số hiệu, ngày hiệu lực, văn bản liên quan |
| 1 | Khởi tạo gói | `K pack init --root nguon/goi/<mảng> --topic "<mảng>" --run <mã-đợt> --researcher <runtime>` | Có `ontology.yaml`, `claims/`, `sources/`, `_evidence/<mã-đợt>/` |
| 2 | **Hỏi chủ repo duyệt schema** (loại đối tượng `van-ban`, `dieu-khoan`, `xung-dot` nếu cần thêm) | `AskUserQuestion` | Có câu trả lời; chưa duyệt thì không dựng |
| 3 | Đóng băng bản gốc | `K ingest --freeze <url Công báo> --root P --run R --stem <tên-ngắn>` | In ra sha256 và có dòng trong `captures.jsonl` |
| 4 | Ghi từng điều khoản | `echo '<atom json>' \| K run record --root P --id R` rồi `K action promote-claim --root P --param atom=<id> --param id=<mã-claim> --param publisher=<cơ quan ban hành> --param kind=official` | Claim có trích ≥ ngưỡng công cụ, nằm trong bản đóng băng |
| 5 | Liên kết, mâu thuẫn | `K action add-link ... --param link_type=cites`; luật mới đè luật cũ ⇒ atom `CONTRADICTION` rồi `resolve-contradiction` kèm lý do | Không còn mâu thuẫn chưa giải quyết |
| 6 | Thẩm định độc lập | `K run review --root P --id R --reviewer <runtime-khác> --verdict pass` | Có `_evidence/R/review.json` |
| 7 | Kiểm để chứng nhận | `K pack check --root P --recheck` | Dòng `gate:` lấy từ `--recheck` |
| 8 | Bàn giao | mẫu bên dưới | Báo cả chỗ chưa qua |

Cờ chi tiết: `ben-ngoai/design-os-knowledge-builder/skills/es-knowledge-forge/contract.txt`. Luồng đầy đủ: `.../references/ontology-first-workflow.md`.

## Gắn nhãn kết quả

| Điều kiện | Ghi vào cột `Kiểm` / `muc-tin-cay` |
|---|---|
| Quote khớp bản đóng băng **và** `gate` trả `STOP_SUFFICIENT` sau `--recheck` | `toàn văn: Điều …` · đã kiểm chứng |
| Quote khớp nhưng chưa thẩm định, hoặc gate là `DEEPEN` / `PAUSE_BUDGET` | `số+ngày` · thu thập, **chưa** kiểm chứng; ghi rõ gate còn thiếu gì |
| Không đóng băng được | `chưa xác minh — tra Công báo` |

## Chỗ dễ vướng

| Tình huống | Làm |
|---|---|
| Trang trả 401/403/429, hoặc môi trường chặn mạng tới *.gov.vn | Nhờ người dùng lưu trang rồi `ingest --freeze <url> --from-file <file>`. Không thay bằng trang tư nhân |
| Gate báo thiếu nguồn độc lập | Công cụ đếm **số cơ quan công bố** khác nhau. Một luật chỉ có một cơ quan ban hành thì có thể không đủ; đóng băng thêm bản ở cổng khác (vd. vbpl.vn) với `publisher` đúng cơ quan công bố. **Chưa kiểm trên luật thật** — nếu vẫn `DEEPEN`, ghi đúng như vậy, không sửa `state.json` |
| Văn bản chỉ có PDF | Đóng băng nhận trang web; chưa có cách đã kiểm cho PDF. Ghi vào báo cáo là chưa đóng băng được |
| `K` báo `unattested sources` | File không có dòng khớp trong `captures.jsonl`; đóng băng lại bằng lệnh, không chép tay |

## Mẫu bàn giao

```text
GÓI: <đường dẫn gói>   ĐỢT: <mã đợt>
VĂN BẢN: <số hiệu> — hiệu lực <ngày> — bị thay bởi <…/không>
KIỂM: <số điều đã có claim> / <số điều cần>
THẨM ĐỊNH: <runtime nghiên cứu> vs <runtime thẩm định>, hoặc THIẾU
GATE: <dòng gate của pack check --recheck, nguyên văn>
GIỚI HẠN: <điều chưa kiểm, nguồn một cơ quan, PDF chưa đóng băng…>
ẢNH HƯỞNG: <repo / mục cần xem lại>
Không phải tư vấn pháp lý.
```
