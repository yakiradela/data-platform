FROM python:3.9-slim

# העתקת קובץ requirements לקונטיינר
COPY requirements.txt ./

# התקנת התלויות
RUN pip install --no-cache-dir -r requirements.txt

# התקנה של Airflow והתלויות החסרות
RUN pip install apache-airflow==2.4.0 psycopg2 boto3

# חשיפת פורט
EXPOSE 8084

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "data-pipelines/dags/rds_to_redshift.py"]
