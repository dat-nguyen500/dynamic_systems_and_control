const int buttonPin = 12;      // Chân nút nhấn với pull-up
const int encoderPin = 2;      // Chân tín hiệu encoder
const int pwmPin = 6;          // Chân PWM cho driver động cơ

volatile long pulseCount = 0;  // Biến đếm xung từ encoder
bool motorRunning = false;     // Trạng thái động cơ
unsigned long lastTime = 0;    // Thời gian trước để tính 100ms
unsigned long startTime = 0;   // Thời gian bắt đầu chạy động cơ

void setup() {
  pinMode(buttonPin, INPUT);   // Chân nút nhấn là input (pull-up sẵn)
  pinMode(encoderPin, INPUT);  // Chân encoder là input
  pinMode(pwmPin, OUTPUT);     // Chân PWM là output
  
  Serial.begin(9600);          // Khởi động Serial
  attachInterrupt(digitalPinToInterrupt(encoderPin), countPulse, RISING);                                   
                               // Ngắt khi có cạnh lên

  // Tiêu đề cho file TXT
  Serial.println("Time(ms),Angle(rad)");
}

void loop() {
  // Kiểm tra trạng thái nút nhấn
  // Nút nhấn pull-up nên LOW là khi nhấn
  if (digitalRead(buttonPin) == LOW) {
    delay(50);                // Chống dội nút
    if (digitalRead(buttonPin) == LOW && !motorRunning) {
      motorRunning = true;    // Bật động cơ
      pulseCount = 0;         // Reset số đếm xung khi bắt đầu
      startTime = millis();   // Lưu thời gian bắt đầu
      analogWrite(pwmPin, 255); // PWM 100% (255/255)
    }
  }

  // Nếu động cơ đang chạy
  if (motorRunning) {
    unsigned long currentTime = millis();
    
    // Kiểm tra nếu đã chạy được 50 giây
    if (currentTime - startTime >= 50000) { // 50 giây = 50000ms
      motorRunning = false; // Tắt động cơ
      analogWrite(pwmPin, 0); // Dừng PWM
      return; // Thoát vòng lặp để không ghi thêm
    }
    
    // Cứ mỗi 100ms ghi dữ liệu
    if (currentTime - lastTime >= 100) {
      // Tính tổng góc quay (số xung * 0.1pi)
      float angle = pulseCount * 0.1 * PI;
      
      // Ghi dữ liệu theo định dạng CSV: thời gian, góc
      Serial.print("3,");
      Serial.println(angle, 10); // Góc với 10 chữ số thập phân
      
      lastTime = currentTime;
    }
  }
}

// Hàm xử lý ngắt để đếm xung từ encoder
void countPulse() {
  pulseCount++;
}
