FROM python:3.9-slim

# הגדרת ספריית עבודה
WORKDIR /app

# העתקת קובץ requirements לקונטיינר
COPY requirements.txt .

# התקנת התלויות
RUN pip install --no-cache-dir -r requirements.txt

# העתקת קוד האפליקציה לקונטיינר
COPY . .

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "kafka_to_rds.py"]

