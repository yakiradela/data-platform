# השתמש בתמונה עם Python 3.9 (סלימית)
FROM python:3.9-slim

# יצירת תיקיית עבודה בקונטיינר
WORKDIR /app

# העתקת קובץ requirements.txt לתוך הקונטיינר
COPY requirements.txt ./

# התקנת התלויות מתוך requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# התקנת Apache Airflow גרסה 2.4.0 אם לא הותקנה ב-requirements
RUN pip install apache-airflow==2.4.0

# חשיפת פורט 8084 לשימוש
EXPOSE 8084

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "data-pipelines/dags/rds_to_redshift.py"]
