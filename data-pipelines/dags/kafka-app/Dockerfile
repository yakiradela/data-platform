FROM python:3.9-slim

# עדכון רשימת החבילות והתקנת libpq-dev
RUN apt-get update && apt-get install -y libpq-dev

# העתקת קובץ requirements לקונטיינר
COPY requirements.txt /app/requirements.txt

# התקנת התלויות
RUN pip install --no-cache-dir -r /app/requirements.txt

# העתקת קוד האפליקציה לקונטיינר
COPY . /app/

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "kafka_to_rds.py"]
