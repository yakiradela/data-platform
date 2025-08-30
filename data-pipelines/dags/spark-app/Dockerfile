FROM python:3.9-slim

# העתקת קובץ requirements לקונטיינר
COPY requirements_spark_batch_job.txt ./

# התקנת התלויות
RUN pip install --no-cache-dir -r requirements_spark_batch_job.txt

# התקנה של Airflow, Kubernetes ו-PySpark
RUN pip install apache-airflow==2.4.0 kubernetes pyspark

# חשיפת פורט
EXPOSE 8080

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "data-pipelines/dags/spark_batch_job.py"]
