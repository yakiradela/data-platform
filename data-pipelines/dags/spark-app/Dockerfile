FROM python:3.9-slim

COPY requirements_spark_batch_job.txt .

RUN pip install --no-cache-dir -r requirements_spark_batch_job.txt

RUN pip install apache-airflow==2.4.0 kubernetes pyspark

EXPOSE 8080

CMD ["python", "data-pipelines/dags/spark_batch_job.py"]

