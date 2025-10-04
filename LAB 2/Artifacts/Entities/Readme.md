1. Entity cho hệ thống nhà hàng

Customer (Khách hàng)

Table (Bàn ăn cụ thể)

MenuItem (Món ăn / Thức uống)

Order (Đơn hàng)

Payment (Thanh toán)

Staff (Nhân viên: lễ tân, phục vụ, quản lý)

2. Mối quan hệ (ER -> Class Diagram)

Customer 1 – N Order (mỗi khách có thể đặt nhiều đơn hàng).

Order 1 – N Payment (mỗi đơn có thể có nhiều lần thanh toán – ví dụ chia bill).

Order N – N MenuItem (mỗi đơn có nhiều món, mỗi món có thể xuất hiện ở nhiều đơn → cần bảng trung gian OrderItem).

Table 1 – N Order (một bàn có thể có nhiều đơn trong ngày).

Staff 1 – N Order (nhân viên phục vụ quản lý nhiều đơn)
