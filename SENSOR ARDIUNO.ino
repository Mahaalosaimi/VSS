#include <ESP8266Firebase.h>
#include <ESP8266WiFi.h>
int pir =D2;  
int Led = D8; 
int button= D7; 
int val; 
int Bval;
String motion = "detected";   
String nomotion="nomotion";
FirebaseData firebaseData ;
#define WIFI_SSID "Huawei-B4A6"
#define WIFI_PASSWORD "0551959302"
#define FIREBASE_AUTH  "MRXbpeIaU0vvN3zpL7LTDlLn0RtWOVFIyayYp3iQ"
#define FIREBASE_HOST "vs-sensor-default-rtdb.firebaseio.com" 
void setup()
{
  Serial.begin(9600); 

WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED)
      {
    Serial.print(".");
    delay(500);
      }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  pinMode(Led, OUTPUT); 
  pinMode(pir,INPUT); 
  pinMode(button,INPUT_PULLUP); 
}
void loop()
{
  Bval=digitalRead(button);
  if(Bval == LOW){  
     val=digitalRead(pir);  
    if(val==HIGH){ 
     digitalWrite(Led,HIGH);   
     Serial.println("motion");
Firebase.setString(firebaseData,"State",motion); 
      delay(500);
      }
      digitalWrite(Led,LOW);
    }
  else
  {
  digitalWrite(Led, LOW);             
     Serial.println("no motion");  
Firebase.setString(firebaseData, "State",nomotion);   
delay(500);
  }
}