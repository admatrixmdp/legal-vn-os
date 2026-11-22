# DECISIONS

| Ngày | Bối cảnh | Lựa chọn | Chọn | Lý do | Đảo ngược được |
|---|---|---|---|---|---|
| 2026-10-26 | Đặt tri thức pháp lý ở đâu | Gộp vào `compliance-vn` / gộp vào repo kế toán / repo riêng | **Repo riêng `legal-vn-os`** | Gộp vào `compliance-vn` làm chìm phần nhắc việc tuân thủ; luật đổi hằng tháng, lịch nhắc cần ổn định | C |
| 2026-10-26 | Cách đưa `vn-legal-skills` vào | Cài từ bên ngoài / chép rồi sửa trực tiếp / chép nguyên vẹn + script đồng bộ | **Chép nguyên vẹn vào `ben-ngoai/` + script đồng bộ** | Không phụ thuộc repo gốc còn sống hay không; vẫn lấy được bản mới; không lệch với bản gốc | C |
| 2026-11-22 | Cách đưa `design-os-knowledge-builder` vào | Cài theo commit khi cần chạy / chép nguyên vẹn + script đồng bộ | **Chép nguyên vẹn vào `ben-ngoai/` + script đồng bộ** (Quân chốt) | Cùng cách với `vn-legal-skills`; MQ dùng nội bộ để kiểm chứng tri thức luật, không làm sản phẩm cạnh tranh với công cụ; giữ `LICENSE` và dòng Required Notice | C |
| 2026-11-22 | Skill kiểm chứng luật của MQ | Tên `kiem-chung-luat` / `trich-dan-luat`; đặt trong plugin riêng / plugin gốc repo | **`kiem-chung-luat`**, đóng gói là plugin `legal-vn-os` (nguồn `./`) | Quân chọn tên. Plugin nguồn `./` mang theo cả động cơ trong `ben-ngoai/` nên skill gọi được bằng đường dẫn tương đối | C |
| 2026-10-26 | Tên skill | Giữ `vn-legal-check` / đổi tên tiếng Việt | Giữ tên gốc lúc này | Đổi tên làm lệch với bản gốc khi đồng bộ; xét lại khi viết skill riêng của MQ | C |
