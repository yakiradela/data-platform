# השתמש בתמונה עם Python 3.9 (סלימית)
FROM python:3.9-slim

# עדכון החבילות והתקנת תלויות סיסטם (ל-psycopg2)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && apt-get clean

# יצירת תיקיית עבודה בקונטיינר
WORKDIR /app

# העתקת קובץ requirements.txt לתוך הקונטיינר
COPY requirements.txt ./

# התקנת התלויות מתוך requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# התקנת Apache Airflow גרסה 2.4.0 יחד עם psycopg2 ו-boto3 אם לא הותקנו ב-requirements
RUN pip install apache-airflow==2.4.0 psycopg2 boto3

# חשיפת פורט 8084 לשימוש
EXPOSE 8084

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "data-pipelines/dags/rds_to_redshift.py"]
