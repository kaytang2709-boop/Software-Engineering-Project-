# 📑 Use Case Description -- Hệ thống quản lý nhà hàng

------------------------------------------------------------------------

## Use Case 1: Login

**Use Case ID:** UC-01
**Actor:** Admin, Manager
**Trigger:** Actor chọn chức năng "Login" và nhập thông tin đăng nhập.

**Description:**
Cho phép Admin/Manager đăng nhập vào hệ thống bằng tài khoản hợp lệ để
truy cập các chức năng quản lý.

**Preconditions:**
1. Actor đã có tài khoản trong hệ thống.
2. Hệ thống đang hoạt động bình thường.

**Postconditions:**
1. Actor đăng nhập thành công và được phân quyền.
2. Nếu thất bại, hệ thống giữ nguyên ở màn hình đăng nhập.

**Basic Flow:**
1. Actor nhập username/password.
2. Hệ thống kiểm tra thông tin.
3. Nếu hợp lệ, đăng nhập thành công → chuyển đến giao diện chính.

**Alternative Flow:**
- UC-01.AC.1: Actor chọn "Quên mật khẩu" → hệ thống hỗ trợ đặt lại mật
khẩu qua email.

**Exception Flow:**
- UC-01.EX.1: Sai mật khẩu quá 5 lần → hệ thống khóa tài khoản tạm
thời.
- UC-01.EX.2: Lỗi kết nối server → hiển thị thông báo thử lại.

------------------------------------------------------------------------

## Use Case 2: Quản lý người dùng (Admin)

**Use Case ID:** UC-02
**Actor:** Admin
**Trigger:** Admin chọn chức năng "Quản lý người dùng".

**Description:**
Cho phép Admin thêm, sửa, xóa tài khoản người dùng và phân quyền
(Manager, Nhân viên).

**Preconditions:**
- Admin đã đăng nhập.

**Postconditions:**
- Người dùng mới được thêm, hoặc thông tin được cập nhật.

**Basic Flow:**
1. Admin chọn "Thêm/Sửa/Xóa tài khoản".
2. Nhập thông tin người dùng.
3. Hệ thống lưu thay đổi vào CSDL.

**Exception Flow:**
- UC-02.EX.1: Tài khoản trùng username → thông báo lỗi.
- UC-02.EX.2: Lỗi kết nối DB → lưu thất bại.

------------------------------------------------------------------------

## Use Case 3: Quản lý thực đơn (Manager)

**Use Case ID:** UC-03
**Actor:** Manager
**Trigger:** Manager chọn chức năng "Quản lý thực đơn".

**Description:**
Cho phép Manager thêm, sửa, xóa món ăn/đồ uống, cập nhật giá, tình trạng
món.

**Preconditions:**
- Manager đã đăng nhập.

**Postconditions:**
- Thực đơn được cập nhật và hiển thị cho nhân viên/khách hàng.

**Basic Flow:**
1. Manager chọn "Thêm/Sửa/Xóa món ăn".
2. Nhập thông tin (tên món, giá, tình trạng).
3. Hệ thống cập nhật và lưu vào CSDL.

**Alternative Flow:**
- UC-03.AC.1: Manager nhập thông tin chi tiết (ảnh, nguyên liệu) → hiển
thị kèm trong menu.

**Exception Flow:**
- UC-03.EX.1: Nhập thiếu thông tin bắt buộc → thông báo lỗi.
- UC-03.EX.2: Lỗi hệ thống → thay đổi không lưu được.

------------------------------------------------------------------------

## Use Case 4: Quản lý đặt bàn & đơn hàng (Manager)

**Use Case ID:** UC-04
**Actor:** Manager
**Trigger:** Manager chọn "Quản lý đặt bàn & đơn hàng".

**Description:**
Quản lý booking bàn và đơn hàng khách đã đặt (xác nhận, hủy, thay đổi).

**Preconditions:**
- Manager đã đăng nhập.

**Postconditions:**
- Thông tin bàn/đơn hàng được cập nhật.

**Basic Flow:**
1. Manager xem danh sách đặt bàn.
2. Chọn booking cần xử lý.
3. Xác nhận/Chỉnh sửa/Hủy đơn hàng.
4. Hệ thống cập nhật trạng thái.

**Exception Flow:**
- UC-04.EX.1: Bàn đã được đặt trước đó → hệ thống cảnh báo trùng.

------------------------------------------------------------------------

## Use Case 5: Quản lý báo cáo (Admin) & Quản lý doanh thu (Manager)

**Use Case ID:** UC-05
**Actor:** Admin / Manager
**Trigger:** Actor chọn "Xem báo cáo".

**Description:**
Hệ thống cung cấp báo cáo doanh thu, chi phí, hiệu suất theo thời gian.

**Preconditions:**
- Actor đã đăng nhập.

**Postconditions:**
- Báo cáo được hiển thị hoặc xuất ra file.

**Basic Flow:**\
1. Actor chọn loại báo cáo (doanh thu, chi phí, hiệu suất).
2. Nhập điều kiện lọc (thời gian, chi nhánh).
3. Hệ thống xử lý dữ liệu.
4. Kết quả hiển thị hoặc xuất PDF/Excel.

**Exception Flow:**
- UC-05.EX.1: Không có dữ liệu trong khoảng thời gian → hiển thị "Không
có dữ liệu".
