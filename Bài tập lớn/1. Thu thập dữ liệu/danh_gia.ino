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
  if (digitalRead(buttonPin) == LOW) {
    delay(50);                // Chống dội nút
    if (digitalRead(buttonPin) == LOW && !motorRunning) {
      motorRunning = true;    // Bật động cơ
      pulseCount = 0;         // Reset số đếm xung khi bắt đầu
      startTime = millis();   // Lưu thời gian bắt đầu
    }
  }

  // Nếu động cơ đang chạy
  if (motorRunning) {
    unsigned long currentTime = millis();
    unsigned long elapsedTime = currentTime - startTime;

    // Kiểm tra nếu đã chạy được 50 giây
    if (elapsedTime >= 50000) { // 50 giây = 50000ms
      motorRunning = false; // Tắt động cơ
      analogWrite(pwmPin, 0); // Dừng PWM
      return; // Thoát vòng lặp để không ghi thêm
    }

    // Điều chỉnh mức PWM theo thời gian
    int pwmValue = 0;
    if (elapsedTime < 10000) {
      pwmValue = 255 * 0.3;  // 30%
    } else if (elapsedTime < 20000) {
      pwmValue = 255 * 0.35; // 35%
    } else if (elapsedTime < 30000) {
      pwmValue = 255 * 0.4;  // 40%
    } else if (elapsedTime < 40000) {
      pwmValue = 255 * 0.45; // 45%
    } else {
      pwmValue = 255 * 0.5;  // 50%
    }
    analogWrite(pwmPin, pwmValue);
    
    // Cứ mỗi 100ms ghi dữ liệu
    if (currentTime - lastTime >= 100) {
      float angle = pulseCount * 0.1 * PI;
      Serial.print(pwmValue * 10 / 255);
      Serial.print(",");
      Serial.println(angle, 10);
      lastTime = currentTime;
    }
  }
}

// Hàm xử lý ngắt để đếm xung từ encoder
void countPulse() {
  pulseCount++;
}
