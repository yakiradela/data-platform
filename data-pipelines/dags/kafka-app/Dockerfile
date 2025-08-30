FROM python:3.9-slim

# העתקת קובץ requirements.txt לקונטיינר
COPY requirements.txt /app/requirements.txt

# התקנת התלויות
RUN pip install --no-cache-dir -r /app/requirements.txt

# העתקת קוד האפליקציה לקונטיינר
COPY . /app

# הגדרת תיקיית עבודה
WORKDIR /app

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "kafka_to_rds.py"]
