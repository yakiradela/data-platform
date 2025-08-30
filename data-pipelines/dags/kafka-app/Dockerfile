FROM python:3.9-slim

# העתקת קובץ requirements לקונטיינר
COPY requirements.txt ./

# התקנת התלויות
RUN pip install --no-cache-dir -r requirements.txt

# העתקת קוד האפליקציה לקונטיינר
COPY . /app

# הגדרת תיקיית עבודה
WORKDIR /app

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "kafka_to_rds.py"]
