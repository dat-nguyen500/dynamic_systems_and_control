% Đọc dữ liệu từ file
[V, theta] = readvars('nhan_dien.txt');
[V1, theta1] = readvars('danh_gia.txt');

% Thời gian lấy mẫu
Ts = 0.1;

% Tạo iddata
data = iddata(theta, V, Ts);
data1 = iddata(theta1, V1, Ts);

% Thiết lập tùy chọn
opt = tfestOptions('InitialCondition', 'zero');

% Ước lượng hàm truyền (3 cực, 0 zero)
sys = tfest(data, 3, 0, opt)

% Kiểm tra trên tập dữ liệu đánh giá
figure(1);
compare(data1, sys);

% Lấy tử số và mẫu số
num = [sys.Numerator, 0];
den = [sys.Denominator(1) sys.Denominator(2) sys.Denominator(3) 0];

% Tạo và tối giản hàm truyền
G = tf(num, den);
G = minreal(G)

% Tính tốc độ ổn định
omega = dcgain(G)

% Vẽ đồ thị bước của hàm truyền
figure(2);
step(G);

% Thông tin hàm bước
stepinfo(G)
%
