const int buttonPin = 12;    // Chân nút nhấn
const int pwmPin = 6;        // Chân PWM điều khiển driver
const int encoderPin = 2;    // Chân tín hiệu encoder

volatile unsigned long pulseCount = 0;
unsigned long lastPulseCount = 0;
unsigned long lastTime = 0;
unsigned long startTime = 0;
const int sampleInterval = 100;  // Đo mỗi 0.1 giây (100ms)
const int pulsesPerRev = 20;     // Giả định 20 xung/vòng
bool motorRunning = false;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(pwmPin, OUTPUT);
  pinMode(encoderPin, INPUT);
  
  attachInterrupt(digitalPinToInterrupt(encoderPin), countPulse, RISING);
  Serial.begin(9600);
}

void loop() {
  static bool lastButtonState = HIGH;
  bool currentButtonState = digitalRead(buttonPin);
  
  if (currentButtonState == LOW && lastButtonState == HIGH && !motorRunning) {
    delay(50);
    if (digitalRead(buttonPin) == LOW) {
      startMotor();
    }
  }
  lastButtonState = currentButtonState;
  
  if (motorRunning) {
    unsigned long currentTime = millis();
    
    if (currentTime - lastTime >= sampleInterval) {
      calculateAngularDisplacement(currentTime);
      lastTime = currentTime;
    }
    
    if (currentTime - startTime >= 50000) {
      stopMotor();
    }
  }
}

void countPulse() {
  static unsigned long lastPulseTime = 0;
  unsigned long currentPulseTime = micros();
  
  // Lọc nhiễu: 1000 microseconds (1ms)
  if (currentPulseTime - lastPulseTime >= 1000) {
    pulseCount++;
    lastPulseTime = currentPulseTime;
  }
}

void startMotor() {
  analogWrite(pwmPin, 201); // Ứng với 6V đầu vào
  pulseCount = 0;
  lastPulseCount = 0;
  startTime = millis();
  lastTime = startTime;
  motorRunning = true;
}

void calculateAngularDisplacement(unsigned long currentTime) {
  noInterrupts();
  unsigned long pulses = pulseCount - lastPulseCount;
  lastPulseCount = pulseCount;
  interrupts();
  
  // Tính toán chuyển vị góc
  float timeElapsed = (float)(currentTime - startTime) / 1000.0;  // Thời gian từ lúc bắt đầu (giây)
  float revolutions = (float)pulseCount / pulsesPerRev;          // Tổng số vòng từ lúc bắt đầu
  float angularDisplacement = revolutions * 2 * PI;              // Chuyển vị góc (radian)
  
  // Xuất dạng TXT: điện áp, chuyển vị góc (rad)
  Serial.print("6,");
  Serial.println(angularDisplacement, 10);
}

void stopMotor() {
  analogWrite(pwmPin, 0);
  motorRunning = false;
}
